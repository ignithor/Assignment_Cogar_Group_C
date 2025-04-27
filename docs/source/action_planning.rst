.. _action-planning:

Action Planning Based on Cooking State and Task History
=======================================================

This section describes the architecture of the "Action Planning Based on Cooking State and Task History" component, based on its behavioural diagrams (Sequence diagram, activity diagram, and state machine diagram).

Interfaces with Other Components
---------------------------------

As illustrated in the :ref:`component diagram <uml-c>`, the component interacts with the Recipe Tracker, the Human Command Monitoring, the speaker, the navigation, and the perception components.

To communicate with Recipe Tracker, the Human Command Monitoring, and the navigation, it uses a data interface called *step.action*, exposing the data of the current step of the recipe.

.. code-block:: text

    # goal
    string action
    string ingredient
    ---
    # result
    bool success
    ---
    # feedback
    string status

Thus, a step is represented by a verb of **action** ("cutting", "pouring", "mixing") and an **ingredient** ("carrots", "leeks", "cheese", etc.). The string type enables formalizing the spoken language with token words which can be understood and spoken naturally both by the robot and an elder person.

This interface is stateless, as each incoming step is processed independently. It is a data interface, transmitting structured step descriptions, and is strongly-typed to ensure the integrity and validation of the step format.

To communicate with the speaker, it uses a data interface called *Speaker.srv*, exposing the data of the text to be spoken.

.. code-block:: text

   string message
   ---
   bool success

This interface is stateless, as each call to the speaker is independent and does not rely on previous interactions. The interface is strongly-typed, defined explicitly by the service schema where the request includes a string message field and the response returns a bool success indicating whether the speech action was successfully triggered.

To communicate with the perception, it uses a data interface called *Perception.srv*.

.. code-block:: text

   string[] objects
   ---
   bool found

This service interface is used by the action planning to check if the objects are in the environment. It returns a boolean indicating whether the object was found or not. For example, if the action is to cut carrots, the action planner will check if the knife and the carrots are in the environment before validating that it can execute the action.

This interface is stateful because object availability and search outcomes are tied to the current active plan. It operates as a service interface, where the Action Planning module calls a function and waits for a response. It is strongly-typed, with defined request and response message formats.

Sequence Diagram
-----------------

.. _uml-seq-ap:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/action_planning/diagrams/sequence_diagram.png
   :alt: Sequence diagram
   :align: center
   :width: 80%

   Sequence diagram for the Action Planning Based on Cooking State and Task History component.

First, the Human Command Monitoring module captures a command from the user and sends a corresponding step to the Recipe Tracking module. Recipe Tracking forwards this step to the Action Planning module.

Once the Action Planning module receives the step, it queries the Perception module to check whether the objects needed to perform the step are available in the environment. If the required objects are found, the Action Planning module splits the step into smaller executable sub-steps.

It then enters a loop, where each small step is sequentially sent to the Navigation module for execution. This loop continues until all sub-steps are completed. If the required objects are not found, the Action Planning module notifies the user via the Speaker module to inform them of the missing items.

Simultaneously, it sends a conflict message to the Conflict Solver module. The Conflict Solver analyzes the situation and generates a new plan, which it sends back to the Action Planning module to replace the original step. The system then follows the new plan, resuming the normal execution flow.

Activity Diagram
-----------------

.. _uml-a-ap:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/action_planning/diagrams/activity_diagram.png
   :alt: Activity diagram
   :align: center
   :width: 100%

   Activity diagram for the Action Planning Based on Cooking State and Task History component.

The activity diagram describes the internal logic for handling an incoming step in the system. It starts when a new step is received. The system first parses the step, then checks the current and past steps to maintain consistency.

The new step is then added to a stack called *stack_step*. Once the step is stored, the system looks for the objects required to perform the last step added.

If the objects are available, the step is split into several smaller steps, and each small step is sent for execution. For example, for cutting carrots, the small steps can be : take the knife, take the carrots, cutting the carrots in small pieces, drop the knife. After executing, the system records the success of the small steps and updates a second list called *steps_done*.

It checks if the *stack_step* is empty; if not, it loops back to manage any remaining steps. If the *stack_step* is empty, the process ends. If, during object lookup, the required objects are not available, the system announces a conflict to the user.

It then attempts to resolve the conflict by generating a new plan or finding an alternative step. After conflict resolution, the system checks if a new step has been found. If yes, it continues the process with the new step; if not, it checks if the *stack_step* is empty before concluding the process.

State Machine Diagram
----------------------

.. _uml-sm-ap:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/action_planning/diagrams/state_machine_diagram.png
   :alt: State machine diagram
   :align: center
   :width: 100%

   State diagram for the Action Planning Based on Cooking State and Task History component.

The state machine starts when a step is received. The first state is "step processing", where the system parses the incoming step, checks the current cooking progress, checks past steps, and finally adds the step to the stack if it is new.

The system then transitions to the "Check requirements" state, where it looks for the objects needed for the last step of the stack and verifies if the action is possible.

If the required objects are located, the system transitions to the "Step splitting" state, where the step is divided into several smaller steps.

Each small step is executed, and once finished, the system updates the step status. If the stack of steps becomes empty after execution, the system finishes the process and waits for a new step.

If the objects are not located, the system transitions to the "Conflict Resolution" state, where it announces the conflict, determines an alternative based on the current cooking progress, and announces the resolution.

If a new step is determined during conflict resolution, the system loops back to reprocess steps. If no new step is found, it checks if the stack is empty. If the stack is empty, the process ends; otherwise, it continues checking requirements or waits for new instructions.

Dummy Implementation of the Cognitive Architecture
----------------------------------------------------

.. automodule:: action_planning.scripts.action_planning
   :members:

KPIs: Action Planning
---------------------

The performance of the Action Planning module can be evaluated using several key KPIs.

- **Step Success Rate**: Measures the percentage of steps that are successfully executed without requiring conflict resolution or manual intervention. A high success rate indicates efficient planning and accurate execution.

- **Average Conflict Resolution Time**: Tracks how long the system takes to detect, resolve, and recover from conflicts when a planned step cannot be executed as expected. Shorter resolution times reflect better system reactivity and user experience.

- **Step Processing Time**: Monitors the time taken from the reception of a new step to its full integration into the execution stack, including parsing, checking requirements, and preparing the step. Efficient processing ensures that the system can handle real-time instructions without delay.

- **Error Rate**: Captures the number of failed steps or unresolved conflicts relative to the total number of actions attempted. A low error rate indicates a robust action planning system.

- **User Satisfaction Score**: Can be collected through user feedback, assessing how well the system meets user expectations and needs during the cooking process. This qualitative measure is essential for understanding the overall effectiveness of the action planning component in a real-world scenario.
