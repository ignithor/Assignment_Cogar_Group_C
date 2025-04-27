.. _human_command:

Human Command Monitoring and Conflict Resolution
================================================

This section describes the architecture of the "Human Command Monitoring and Conflict Resolution" component, based on its behavioural diagrams (use case diagram, sequence diagram, activity diagram, and state machine diagram).

Interfaces with Other Components
---------------------------------

TODO

Sequence Diagram
-----------------

.. _uml-seq-hc:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/sequence_diagram.drawio.png
   :alt: Sequence diagram
   :align: center
   :width: 60%

   Sequence diagram for Human Command Monitoring and Conflict Resolution

In the :ref:`sequence diagram for Human Command Monitoring and Conflict Resolution <uml-seq-hc>`, we show how the elder and the robot interact using voice commands.
The elder speaks, the TIAGo robot captures the command, and it is sent to the Human Command Monitoring system.

When the command is received, the Human Command Monitoring checks the current step of the task and asks the Action Planner if the command can be accepted.
If the command is valid, the system accepts it, notifies the user, and a new plan is created based on the command.
If the command is not valid, the system rejects it, notifies the user, and the robot continues following the original plan without any changes.

This way, the robot can adapt to human input when possible, while making sure the task stays organized and correct thanks to the Conflict Resolution part of the system.

Activity Diagram
-----------------

.. _uml-a-hc:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/activity_diagram.drawio.png
   :alt: Activity diagram
   :align: center
   :width: 60%

   Activity diagram for Human Command Monitoring and Conflict Resolution.

The :ref:`activity diagram for Human Command Monitoring and Conflict Resolution <uml-a-hc>` shows how the system handles human commands during task execution.

The process starts when the user (the elder) speaks a command. The system first processes and interprets the command. Then, it checks the current step of the recipe with the Action Planner to decide if the command matches the task or if there is a conflict.

If the command matches the plan, it is accepted, and the Action Planner is notified. The user is then informed that their command was accepted. If the command causes a conflict, the system goes into a conflict resolution phase. It checks if the conflict can be solved without breaking the task.
If the conflict can be solved, the next action is modified, and the flow continues. Otherwise, the system notifies the user that the command was rejected and keeps following the original plan.

This flow ensures that the robot can adapt to the user's commands when possible, while making sure the main task remains consistent and correct.

State Machine Diagram
----------------------

.. _uml-sm-hc:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/state_machine.drawio.png
   :alt: State Machine diagram
   :align: center
   :width: 60%

   State diagram for Human Command Monitoring and Conflict Resolution.

Finally, the last behavioural diagram is the :ref:`State diagram for Human Command Monitoring and Conflict Resolution <uml-sm-hc>`. The system starts in the Idle state, waiting for a verbal command from the user. When a command is received, it transitions to the Listening state and then to the Processing Command state, where the command is interpreted and checked against the current task.

Depending on the validation result, the system either moves to the Command Accepted state to notify the user and adjust the plan, or to the Command Rejected state to reject the command and continue with the original plan. After either outcome, the system returns to Idle, ready to process new commands.

This state machine ensures the robot remains reactive while maintaining consistency in the task execution.

Dummy Implementation of the Cognitive Architecture
---------------------------------------------------

.. automodule:: human_command.scripts.human_command
   :members:

KPI: Human Command Monitoring
------------------------------

- **Response time to human command**: Measures the time between the moment the elder speaks a command and the robot responds (either by accepting, rejecting, or modifying the plan). Ideally, the response time should be under 2–3 seconds to maintain the user's trust and system usability.

- **Conflict resolution accuracy**: Evaluates how often the system correctly detects and handles conflicts between human commands and the ongoing task plan. A high conflict resolution accuracy indicates that the robot can identify problematic commands without wrongly rejecting valid requests or accepting risky ones.

- **Percentage of commands recognized and interpreted**: Refers to the proportion of human commands that are successfully understood and mapped to a valid action or decision in the system. A high recognition rate (> 90%) is desired to ensure smooth collaboration between the elder and the robot.
