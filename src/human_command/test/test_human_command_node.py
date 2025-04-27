#!/usr/bin/env python3

import unittest
import rospy
import rostest
import actionlib
from std_msgs.msg import String
from assignments.msg import stepAction, stepGoal, stepFeedback, stepResult
from assignments.srv import Speaker, SpeakerResponse
from actionlib_msgs.msg import GoalStatus
from threading import Thread
import random

class TestHumanCommandNode(unittest.TestCase):

    def setUp(self):
        rospy.init_node('test_human_command', anonymous=True)

        # Wait for the action server
        self.client = actionlib.SimpleActionClient('/step_action', stepAction)
        self.assertTrue(self.client.wait_for_server(timeout=rospy.Duration(10)))

        # Set up mock speaker service
        self.mock_speaker = rospy.Service('/speaker', Speaker, self.speaker_callback)
        self.speaker_call_count = 0

        # Set up a publisher to simulate voice commands
        self.voice_command_pub = rospy.Publisher('/voice_command', String, queue_size=10)

        # Allow time for the publisher to register
        rospy.sleep(1)

    def speaker_callback(self, req):
        self.speaker_call_count += 1
        return SpeakerResponse(success= (random.random() < 0.9))

    def test_valid_command(self):
        """
        Test a valid command that matches the expected step.
        """
        # Simulate sending a valid voice command
        valid_command = "cutting carrots"
        self.voice_command_pub.publish(valid_command)

        # Wait for the command to be processed
        rospy.sleep(2)

        # Check if the command was sent to the action server
        state = self.client.get_state()
        self.assertEqual(state, GoalStatus.SUCCEEDED)

        # Check if the speaker service was called
        self.assertEqual(self.speaker_call_count, 1)

    def test_invalid_command(self):
        """
        Test an invalid command that does not match the expected step.
        """
        # Simulate sending an invalid voice command
        invalid_command = "mixing all"
        self.voice_command_pub.publish(invalid_command)

        # Wait for the command to be processed
        rospy.sleep(2)

        # Check if the speaker service was called to notify the user
        self.assertEqual(self.speaker_call_count, 1)

    def tearDown(self):
        self.mock_speaker.shutdown()

if __name__ == '__main__':
    rostest.rosrun('your_package_name', 'test_human_command_node', TestHumanCommandNode)
