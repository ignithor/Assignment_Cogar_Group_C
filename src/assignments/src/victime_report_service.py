#!/usr/bin/env python3
import rospy
from assignments.srv import victim_report, victim_reportResponse

def victim_report_callback(req):
    # Print out received victim location and status
    rospy.loginfo(f"Victim detected at ({req.x}, {req.y}, {req.z}), Status: {req.victim_status}")
    
    # Process the victim report and send success response
    success = True  # You can implement logic for reporting to the operator here
    message = "Victim report sent successfully to operator."

    return VictimReportResponse(success, message)

def victim_report_service():
    rospy.init_node('victim_report_service')
    service = rospy.Service('/victim_report', VictimReport, victim_report_callback)
    rospy.loginfo("Victim report service is ready!")
    rospy.spin()

if __name__ == '__main__':
    victim_report_service()