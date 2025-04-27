#!/usr/bin/env python3

"""
.. module:: human_command_node
   :platform: Unix
   :synopsis: Manages human commands, validates them, resolves conflicts, and sends validated commands to an Action Planner.

.. moduleauthor:: Emma Royant

ROS node responsible for interpreting and validating human commands related to cooking tasks:

- Receives human commands via the `/voice_command` topic
- Interprets and validates commands based on current system feedback
- Resolves conflicts with the Action Planner (step actions)
- Sends valid commands to an Action Planner via an action server
- Uses a speaker service to notify the user about command validation and conflict resolution status
- Handles feedback from the Action Planner to adjust command execution
- Notifies the user if the command is invalid or unresolved

"""

import rospy
import actionlib
import random
from std_msgs.msg import String
from assignments.msg import stepAction, stepGoal, stepFeedback, stepResult
from assignments.srv import Speaker

class HumanCommandNode:
    def __init__(self):
        """
        Initialize the HumanCommandNode.
        Subscribes to /step_action/feedback and /voice_command.
        Uses an ActionClient to send validated commands to the Action Planner.
        """
        rospy.init_node('human_command_node')

        self.current_step = None
        self.current_feedback = None
        self.expected_step = None

        # Subscribers
        rospy.Subscriber('/step_action/feedback', stepFeedback, self.feedback_callback)
        rospy.Subscriber('/voice_command', String, self.command_callback)

        # Action client
        self.client = actionlib.SimpleActionClient('/step_action', stepAction)
        rospy.loginfo("Waiting for /step_action server...")
        self.client.wait_for_server()
        rospy.loginfo("/step_action server available.")

        rospy.loginfo("HumanCommandNode ready and listening.")

    def feedback_callback(self, msg):
        """
        Callback to update the current feedback from the Action Planner.
        """
        self.current_feedback = msg.status
        rospy.loginfo(f"Feedback received: {self.current_feedback}")

    def command_callback(self, msg):
        """
        Callback when a human command is received.
        Validates the command and sends it if it matches or if accepted by conflict resolution.
        """
        command = msg.data.strip()
        rospy.loginfo(f"Human command received: {command}")

        interpreted_command = self.interpret_command(command)
        if not interpreted_command:
            rospy.logwarn("Failed to interpret command.")
            self.notify_user("Command not understood.")
            return

        if not self.current_feedback:
            rospy.logwarn("No feedback received yet.")
            return

        if self.validate_command(interpreted_command):
            rospy.loginfo("Command validated. Sending to Action Planner...")
            self.send_goal(interpreted_command)
            self.expected_step = interpreted_command
            self.notify_user(f"Command accepted: {interpreted_command}")
        else:
            rospy.logwarn("Command validation failed. Trying conflict resolution...")
            if self.resolve_conflict(interpreted_command):
                rospy.loginfo("Conflict resolved positively. Sending command to Action Planner.")
                self.send_goal(interpreted_command)
                self.expected_step = interpreted_command
                self.notify_user(f"Conflict resolved. Command accepted: {interpreted_command}")
            else:
                rospy.logwarn("Conflict resolution failed. Command refused.")
                self.notify_user(f"Command refused: {interpreted_command}")

    def interpret_command(self, command):
        """
        Simulates the interpretation of the command.
        For now, it just returns the command as is.
        """

        rospy.loginfo(f"Interpreting command: {command}")
        
        return command

    def validate_command(self, command):
        """
        Validates the command based on the current feedback.
        """
        return random.random() > 0.8

    def resolve_conflict(self, command):
        """
        Conflict resolution function.
        For now: returns True 50% of the time randomly.
        """
        decision = random.choice([True, False])
        rospy.loginfo(f"Conflict resolution decision for '{command}': {'ACCEPTED' if decision else 'REJECTED'}")
        return decision

    def send_goal(self, command):
        """
        Sends the valid command to the Action Planner via an action goal.
        """
        try:
            action, ingredient = command.split(' ', 1)
        except ValueError:
            action = command
            ingredient = ""

        goal = stepGoal(action=action, ingredient=ingredient)
        self.client.send_goal(goal)
        rospy.loginfo(f"Goal sent: {action} {ingredient}")

    def notify_user(self, message):
        """
        Uses the speaker service to notify the user of the decision.
        """
        try:
            rospy.wait_for_service('/speaker', timeout=5)
            speaker = rospy.ServiceProxy('/speaker', Speaker)
            speaker(message)
            rospy.loginfo(f"Notified user: {message}")
        except Exception as e:
            rospy.logerr(f"Speaker service error: {e}")

if __name__ == '__main__':
    try:
        node = HumanCommandNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
