#!/usr/bin/env python
import rospy
from assignments.srv import InterpretCommand, InterpretCommandResponse

def handle_interpret_command(req):
    rospy.loginfo("Interpreting Command...")
    valid_commands = ["pass me the spoon", "add sugar", "stir the bowl"]
    if req.command in valid_commands:
        return InterpretCommandResponse(success=True, action=req.command)
    else:
        return InterpretCommandResponse(success=False, action="Continue with the next action of the plan.")

def interpret_command_service():
    rospy.init_node('interpret_command_service', anonymous=True)
    rospy.Service('interpret_command', InterpretCommand, handle_interpret_command)
    rospy.loginfo("Interpret Command Service is Ready!")
    rospy.spin()

if __name__ == "__main__":
    interpret_command_service()