#!/usr/bin/env python3

import unittest
import rospy
import actionlib
from std_msgs.msg import String
from actionlib_msgs.msg import GoalStatusArray
from assignments.msg import stepAction, stepGoal, stepResult, stepFeedback

class DummyStepActionServer:
    """ A dummy action server for testing purposes. """
    def __init__(self):
        self.server = actionlib.SimpleActionServer('/step_action', stepAction, execute_cb=self.execute_cb, auto_start=False)
        self.server.start()
        rospy.loginfo("Dummy StepAction server started.")

    def execute_cb(self, goal):
        rospy.loginfo(f"Dummy server received goal: action='{goal.action}', ingredient='{goal.ingredient}'")
        rospy.sleep(0.5)  # Simulate small delay
        result = stepResult()
        self.server.set_succeeded(result, "Goal succeeded")
        rospy.loginfo("Dummy server: Goal succeeded.")

class TestHumanCommandNode(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        rospy.init_node('test_human_command_node', anonymous=True)

        # Start the dummy action server
        cls.dummy_server = DummyStepActionServer()

        # Publishers
        cls.voice_pub = rospy.Publisher('/voice_command', String, queue_size=10)

        # Wait until publisher and server are ready
        rospy.sleep(2.0)

        # Prepare to listen to action server status (optional extra check)
        cls.status_sub = rospy.Subscriber('/step_action/status', GoalStatusArray, cls.status_callback)
        cls.last_status = None

    @classmethod
    def status_callback(cls, msg):
        if msg.status_list:
            cls.last_status = msg.status_list[-1].status

    def test_send_voice_command_and_check_goal(self):
        """ Test if sending a voice command results in a goal being processed. """

        # Publish a voice command
        rospy.loginfo("Publishing voice command: 'cut carrots'")
        self.voice_pub.publish(String(data="cut carrots"))

        # Give enough time for node to process and send goal
        timeout_time = rospy.Time.now() + rospy.Duration(8.0)
        while not rospy.is_shutdown() and (self.last_status is None) and (rospy.Time.now() < timeout_time):
            rospy.sleep(0.1)

        # Assert that some goal status has been received
        self.assertIsNotNone(self.last_status, "No goal status received from DummyStepActionServer.")

        # Optional: check if the goal status was 'succeeded' (status == 3)
        self.assertIn(self.last_status, [1, 3], "Unexpected goal status received.")  # 1 = ACTIVE, 3 = SUCCEEDED

    @classmethod
    def tearDownClass(cls):
        rospy.loginfo("Test finished.")

if __name__ == '__main__':
    import rostest
    rostest.rosrun('human_command', 'test_human_command_node', TestHumanCommandNode)
