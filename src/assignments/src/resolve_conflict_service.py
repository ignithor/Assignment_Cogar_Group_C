#!/usr/bin/env python
import rospy
from assignments.srv import ResolveConflict, ResolveConflictResponse

def handle_resolve_conflict(req):
    rospy.loginfo("Resolving Conflict...")

    # List of allowed actions that are not in conflict with "add sugar"
    allowed_actions = ["mix ingredients", "stir the bowl", "add flour", "add water"]

    # Check if the user command is in the allowed actions list
    if req.user_command == "add sugar" and req.planned_action == "cut vegetables":
        # Conflicting request, reject the command
        return ResolveConflictResponse(success=False, action_taken="Command rejected: Wrong step in recipe")
    
    elif req.user_command in allowed_actions:
        # Valid command that doesn't conflict, update plan
        return ResolveConflictResponse(success=True, action_taken="Plan updated with valid action: " + req.user_command)
    
    else:
        # If the command is not in the allowed actions list, reject it
        return ResolveConflictResponse(success=False, action_taken="Command rejected: Action not allowed")

def resolve_conflict_service():
    rospy.init_node('resolve_conflict_service', anonymous=True)
    rospy.Service('resolve_conflict', ResolveConflict, handle_resolve_conflict)
    rospy.loginfo("Resolve Conflict Service is Ready!")
    rospy.spin()

if __name__ == "__main__":
    resolve_conflict_service()