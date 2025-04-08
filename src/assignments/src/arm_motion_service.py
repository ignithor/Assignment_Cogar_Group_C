#!/usr/bin/env python3
import rospy
#from sensor_msgs.msg import JointState
from assignments.srv import CheckJointState, CheckJointStateResponse


expected_joint_count = 7

def check_joint_state(req):
    """
    Service callback that checks the dimensions of the provided JointState request.
    """
    rospy.loginfo("Received joint state for comparison.")

    # Check if the dimensions of positions, velocities, and efforts match the expected joint count
    if len(req.positions) == expected_joint_count and \
       len(req.velocities) == expected_joint_count and \
       len(req.efforts) == expected_joint_count:
        rospy.loginfo("Joint state dimensions match.")
        rospy.sleep(5)
        rospy.loginfo("The arm was moved!")
        return CheckJointStateResponse(True)
    else:
        rospy.loginfo("Joint state does not match.")
        return CheckJointStateResponse(False)

def joint_state_service():
    """
    Initializes the ROS service server that checks the dimensions of the joint state.
    """
    rospy.init_node('joint_state_service', anonymous=True)
    # Create the service that listens for requests
    service = rospy.Service('/check_joint_state', CheckJointState, check_joint_state)
    rospy.loginfo("Joint state service is ready!")
    rospy.spin()

if __name__ == '__main__':
    try:
        joint_state_service()
    except rospy.ROSInterruptException:
        pass