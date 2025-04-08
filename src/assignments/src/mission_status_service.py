#!/usr/bin/env python3
import rospy
from assignments.srv import mission_status, mission_statusResponse

def mission_status_callback(req):
    rospy.loginfo(f"Mission {req.mission_id} status: {'Completed' if req.success else 'Failed'}")
    
    # Logic to determine if the mission is complete (success or failure)
    mission_complete = req.success
    message = "Mission completed successfully." if mission_complete else "Mission failed."

    return MissionStatusResponse(mission_complete, message)

def mission_status_service():
    rospy.init_node('mission_status_service')
    service = rospy.Service('/mission_status', MissionStatus, mission_status_callback)
    rospy.loginfo("Mission status service is ready!")
    rospy.spin()

if __name__ == '__main__':
    mission_status_service()