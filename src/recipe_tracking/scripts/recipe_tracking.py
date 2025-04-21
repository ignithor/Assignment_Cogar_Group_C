#!/usr/bin/env python3

import rospy

class RecipeTrackingNode:
    """
    Very dummy ROS node for recipe tracking and execution history.

    Subscribes to:
        - /dummy_sub (dummy_msgs/Dummies): Dummy.

    Publishes to:
        - /dummy_pub (dummy_msgs/Dummies): Dummy.

    """

    def __init__(self):
        """
        Initialize the Node, (set up subscribers and publisher).
        """
        rospy.init_node('recipe_tracking_node')

        rospy.loginfo("TrackNode initialized")


    def callback(self, msg):
        """
        Callback
        """
        rospy.loginfo("dummy callback")


if __name__ == '__main__':
    try:
        RecipeTrackingNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
