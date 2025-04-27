#!/usr/bin/env python

import rospy
from std_msgs.msg import String

def carrot_publisher():
    # Initialize the ROS node
    rospy.init_node('carrot_publisher', anonymous=True)
    
    # Create a publisher that publishes to the 'carrot_topic'
    pub = rospy.Publisher('/voice_command', String, queue_size=10)
    
    # Set the publishing rate to 0.1 Hz (i.e., every 10 seconds)
    rate = rospy.Rate(0.1)
    
    while not rospy.is_shutdown():
        message = "cut carrots"
        rospy.loginfo(f"Publishing: {message}")
        pub.publish(message)
        rate.sleep()

if __name__ == '__main__':
    try:
        carrot_publisher()
    except rospy.ROSInterruptException:
        pass
