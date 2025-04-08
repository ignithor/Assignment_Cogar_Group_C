#!/usr/bin/env python3
import rospy
from assignments.srv import notifications, notificationsResponse

def notifications_callback(req):
    # Print out received notification data
    rospy.loginfo(f"Received notification for wrong plate: {req.plate_name} at Table: {req.table_number}")
    
    # Here you would implement the logic to notify the staff (e.g., log, send alert, etc.)
    success = True  # Assuming the notification was successfully sent.
    message = f"Notification sent to staff about wrong plate: {req.plate_name} at Table {req.table_number}."
    
    return notificationsResponse(success, message)

def notifications_service():
    rospy.init_node('notifications_service')
    service = rospy.Service('/notifications', notifications, notifications_callback)
    rospy.loginfo("Notifications service is ready!")
    rospy.spin()

if __name__ == '__main__':
    notifications_service()