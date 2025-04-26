Assisting elderly individuals in meal preparation
=================================================

Welcome to the documentation of the first assignment of Cognitive Architecture.

This project is the work of **Group C** on **Topic 3**:

- BEAUJEAN Bertille, S7899816
- PHAM DANG Paul, S7899827
- ROYANT Emma, S8552743

In this document, you will find a description of the software architecture that we designed to assist elder people in cooking tasks with a TIAGo robot.

The documentation will outline the specifications of the assignment, then present the architecture implementation of the given solution through its component diagram. Each component of the system will be described and illustrated with relevant behavioural diagrams. Thereafter, the integration testing KPIs will be presented.

.. toctree::
   :maxdepth: 2
   :caption: Contents:



Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

Assignment: Topic 3
----------------------

This project aims to give assistance to elderly individuals in meal preparation, by helping them in the kitchen in the cooking tasks with the robot TIAGo.

The robot TIAGo is equipped with RGB-D Camera, LiDAR, SONAR, Force Sensors, Microphones, and Speakers.

The architecture should enable the robot to do the following tasks:

-  **Ingredient retrieval** - the robot retrieves ingredients from the shelf, planning an efficient and obstacle-free path using vision and real-time environment mapping.
- **Collaborative cooking process** - the robot collaborates with the elderly person, executing the recipe step by step (mixing, cutting, pouring). Keeps track of the recipe and cooking progress, updating internal representation of the task.
- **Action decision-making** - at each step, the robot determines the next action based on previous steps and current state. Verifies verbal commands (e.g., “Pass me the spoon”) and checks if they align with the planned sequence.
- **Verbal command handling** - if a verbal command conflicts with the planned process, the robot must decide whether to override the plan or reject the request.
- **Object recognition** -TIAGo should recognize objects (tools, ingredients) in the environment.

- **Mission completion** - once the recipe is completed, the robot notifies the user that the meal preparation is finished and ensures that all steps have been followed correctly.


To do so, the documentation will focus particularly on the architecture of three components:

-  :ref:`recipe-tracking`: Maintains an updated internal representation of the recipe and the sequence of performed actions. Ensures the cooking process follows the correct step-by-step execution. Provides necessary data to determine the next best action.
- :ref:`action-planning`: Decides the next action based on the current cooking progress and past steps. Considers the state of the system, ensuring seamless task progression. Dynamically adjusts the sequence in response to unexpected conditions.
- :ref:`human-command`: Recognizes and interprets verbal commands related to object passing or ingredient addition. Evaluates whether a request fits within the expected sequence of actions. If a command is valid, it modifies the plan accordingly. If it is incorrect, the robot rejects the request and follows the original plan.


Presentation of the architecture
--------------------------------

blablabla This is the architecture component diagram with accurate description detailing where different design
patters could play a role in the final architecture implementation.

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/component_diagram.drawio.png
   :alt: Component diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>


The components
--------------

.. _recipe-tracking:

Recipe Tracking and Execution History
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section describes the architecture of the "Recipe Tracking and Execution History" component, based on its behavioural diagrams (use case diagram, sequence diagram, activity diagram and state machine diagram).

Use case diagram
++++++++++++++++++++

.. _uml-uc-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/use_case_diagram.png
   :alt: Use case diagram
   :align: center
   :width: 60%

   Use case diagram for recipe tracking and execution history.

.. raw:: html

   <br><br>

As illustrated in the :ref:`use case diagram for recipe tracking and execution history <uml-uc-rt>`, the main use cases of the component are to go from one step of the recipe to another, while validating those which have been executed properly.

This component interacts once with directly with the elder person: the recipe has to be selected by this actor so that it can work. Aterwards, the only external interaction is with the Action Planner, to communicate the goal step and whether it is reached or not.

It operates with two principal objects:

- the **Step by step recipe checklist**, which correspond to a checklist of the steps of the recipe. This way, it represents the memory of the steps alrerady executed.
- the **Step tracker**, which stores the data of the current step and updates it every time its execution is validated by the Action Planner.

Interfaces with the other components
++++++++++++++++++++++++++++++++++++++++

As illustrated in the :ref:`use case diagram <uml-uc-rt>`, the only interface of this component with another component is with the Action Planner.

It is a data interface, exposing the data of the current step of the recipe.
It is loosely-typed with an action planning which has the following structure:

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

Thus, a step is represented by a verb of **action** ("cutting", "pouring", "mixing") and an **ingredient** ("carrots", "leaks", "cheese", etc.), which are defined by the Recipe tracker and acquired by the Action Planner, and the **success** status (boolean) to know if the step has successed. The string type enables to formalize the spoken language with token words which can be understood and spoken naturally both by the robot and an elder person.

It is a stateless interface which forgets about the previous data it had as soon as the data of a new step is sent. Indeed, the dependence between the different steps is already dealt with by the fact that the steps are validated one by one and in order. So, for the interface, the success of a step can be considered independent of the success of the previous ones.

Finally, the concerns are separated such that this recipe tracker can be initialized independently from the other components.


Sequence diagram
++++++++++++++++++++

.. _uml-seq-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/sequence_diagram.png
   :alt: Sequence diagram
   :align: center
   :width: 80%

   Sequence diagram for recipe tracking and execution history.

.. raw:: html

   <br><br>

In the :ref:`sequence diagram for recipe tracking and execution history <uml-seq-rt>`, we can again point the role of the elder, which is to select the recipe and notify it to the this component to set the recipe checklist accordingly and enable recipe tracking.

The loop guaranties that we continuously check that the current step is not the last one (by convention, the recipe should end by the step "end"). Such that, while the recipe is not over, the step tracker will keep checking with the Action Planner if the current step that it is sharing has been executed successfully.

In case the current step has been executed, and only in this case, the step tracker will notify to the recipe checklist that the current step is validated and get the following step in return, as a new current step.

The sequence either terminates when reaching the "end" step of the recipe, or loops until getting the validation from the Action Planner. Errors are treated by the Action Planner, so the non termination of the sequence (infinite loop) would be a problemn to be solved by the Action Planner.

Activity diagram
++++++++++++++++++++

.. _uml-a-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/activity_diagram.png
   :alt: Activity diagram
   :align: center
   :width: 100%
   
   Activity diagram for recipe tracking and execution history.

.. raw:: html

   <br><br>

The :ref:`activity diagram for recipe tracking and execution history <uml-a-rt>` can be partitioned into two swimlanes.

First, the swimlane of **"User interaction"** is initiated with the selection of a recipe by the user (the elder).  Once the component received a valid recipe from the user, the recipe checklist (*RecipeControl*, a dictionary of the steps and their validation status) and the current step (*step*, from an action planning, composed of a string for the action to do, a string for the ingredient to use and a boolean for the validation status of the step), are initialized. The partition ends with an edge, to mark the initialization of the two previous objects.

Then, the second swimlane **"Recipe tracking"** begins with a join control: the flow reaches the first action only when the edge of the User interaction is reached (*RecipeControl* and *current_step* exist), and when a signal is received from the Action Planner, notifying that the current step has been succesfully executed.
Only then, the execution history is updated (the current step is validated in *RecipeControl*), then the current step is updated (*current_step* takes the data of the next step in the recipe checklist *RecipeControl*).
If the updated current step is the "end" step, the activity is completely terminated. Otherwise, the flow is ended and might be initiated again if a new signal is sent.

State machine diagram
++++++++++++++++++++++++

.. _uml-sm-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/state_diagram.png
   :alt: State machine diagram
   :align: center
   :width: 100%
   
   State diagram for recipe tracking and execution history.

.. raw:: html

   <br><br>
   
Finally, the last behavioural diagram presented is the :ref:`state machine for recipe tracking and execution history <uml-sm-rt>`. One may note that the :ref:`activity diagram <uml-a-rt>` was more appropriate for this component: there are only only two different states defined and one of them represents the **Idle** phase, when the cooking process is initialized (recipe chechlist and current step). This is due to the fact that, with this architecture, the component is constantly checking whether the current step has been executed or not. There is no "waiting" state.

The first state **Idle** is the initialization phase. It checks the validity of the recipe file provided when entering the state, then creates and initializes the recipe checklist, and finally initializes the current step to the first step when leaving the state.

Then the second state represents **Step tracking**. The success of the current step is repetitively checked, until it becomes true. In this case, the state is entered via another entry, to validate the current step in the recipe checklist, then go to the next step, exit all states if the "end" step is reached or send the new step to the action planner otherwise. After checking the success status of the current step for both entries, the state has two different exits, if the step successed or not yet.

Dummy implementation of the cognitive architecture
++++++++++++++++++++++++++++++++++++++++++++++++++++

.. automodule:: recipe_tracking.scripts.recipe_tracking
   :members:

.. raw:: html

   <br><br>


KPI: Recipe Tracker
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
To indicate whether this component is meeting performance goals, the chosen metrics aims at measuring its capacity to know at what step of the recipe the cooking process currently is. That is to say that we can assess:

- the response time relative to the "current" time. If this duration is too long, it would make the whole control of the robot longer as the robot should wait longer to receive a command. This corresponds to the duration between the time when the Robot finishes the step and the time when the Recipe Tracker is notified that the step has successed. A relevant indicator would be the mean and standard deviation of this duration over the steps. For security matters in the meal preparation, an acceptable duration would be under 0.2s, which is the average reaction time for a human with full abilities and would prevent risks of accidents, for exemple with the cutting action. 
- the accuracy of the execution history. With the current architecture, the execution history is supposed to show which steps of the recipe were validated. A relevant indicator would be to check its accuracy, false positive ratio and false negative ratio, and study it by action (cutting, pouring, mixing) and ingredient. An accuracy above 0.9 is expected and particularly a false positive ratio under 0.05. The false negative ratio should be reasonably low but it would cause less troubles in the cooking process to do a step without knowing than not to do a step and keep on with the recipe.

*To assess the accuracy of the Execution history, let's recall and state that the validation status of a step can change if and only if it is the current step and if the Action Planner sends the information that it has successed. As the current step changes to the following when it is validated, consequently, if a step is validated, then all the previous steps are also validated. One may think of modifying the answer of the Action Planner, to enable a third validation state (True, False, Abort), and go to the next step when the current step is not "False" anymore.*



.. _action-planning:

Action Planning Based on Cooking State and Task History
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section describes the architecture of the "Action Planning Based on Cooking State and Task History" component, based on its behavioural diagrams (Sequence diagram, activity diagram and state machine diagram).


Interfaces with the other components
++++++++++++++++++++++++++++++++++++++++

TODO

As illustrated in the :ref:`use case diagram <uml-uc-rt>`, the only interface of this component with another component is with the Action Planner.

It is a data interface, exposing the data of the current step of the recipe.
It is loosely-typed with an action planning which has the following structure:

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

Thus, a step is represented by a verb of **action** ("cutting", "pouring", "mixing") and an **ingredient** ("carrots", "leaks", "cheese", etc.), which are defined by the Recipe tracker and acquired by the Action Planner, and the **success** status (boolean) to know if the step has successed. The string type enables to formalize the spoken language with token words which can be understood and spoken naturally both by the robot and an elder person.

It is a stateless interface which forgets about the previous data it had as soon as the data of a new step is sent. Indeed, the dependence between the different steps is already dealt with by the fact that the steps are validated one by one and in order. So, for the interface, the success of a step can be considered independent of the success of the previous ones.

Finally, the concerns are separated such that this recipe tracker can be initialized independently from the other components.


Sequence diagram
++++++++++++++++++++

.. _uml-seq-ap:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/action_planning/diagrams/sequence_diagram.png
   :alt: Sequence diagram
   :align: center
   :width: 80%

   Sequence diagram for the Action Planning Based on Cooking State and Task History component.

.. raw:: html

   <br><br>

Activity diagram
++++++++++++++++++++

.. _uml-a-ap:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/action_planning/diagrams/activity_diagram.png
   :alt: Activity diagram
   :align: center
   :width: 100%
   
   Activity diagram for the Action Planning Based on Cooking State and Task History component.

.. raw:: html

   <br><br>

State machine diagram
++++++++++++++++++++++++

.. _uml-sm-ap:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/action_planning/diagrams/state_machine_diagram.png
   :alt: State machine diagram
   :align: center
   :width: 100%
   
   State diagram for the Action Planning Based on Cooking State and Task History component.

.. raw:: html

   <br><br>
   


Dummy implementation of the cognitive architecture
++++++++++++++++++++++++++++++++++++++++++++++++++++

.. automodule:: action_planning.scripts.action_planning
   :members:

.. raw:: html

   <br><br>

KPI: Action Planning
~~~~~~~~~~~~~~~~~~~~

We can define our KPI of Action Planning by the average time from receiving a step to successfully completing it (or failing).

Define as sum(execution_times) / total_steps

This shows system efficiency. Delays might be caused by perception latency, planning bottlenecks, slow conflicts resolution or poor hardware interaction.


.. _human-command:

Human Command Monitoring and Conflict Resolution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section describes the architecture of the "Human Command Monitoring and Conflict Resolution" component, based on its behavioural diagrams (use case diagram, sequence diagram, activity diagram and state machine diagram).

Interfaces with the other components
++++++++++++++++++++++++++++++++++++++++

TODO

Sequence diagram
++++++++++++++++++++

.. _uml-seq-hc:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/sequence_diagram.drawio.png
   :alt: Sequence diagram
   :align: center
   :width: 60%

   Sequence diagram for Human Command Monitoring and Conflict Resolution

.. raw:: html

   <br><br>

In the :ref:`sequence diagram for Human Command Monitoring and Conflict Resolution <uml-seq-hc>`, we show how the elder and the robot interact using voice commands. 
The elder speaks, the TIAGo robot captures the command, and it is sent to the Human Command Monitoring system.

When the command is received, the Human Command Monitoring checks the current step of the task and asks the Action Planner if the command can be accepted. 
If the command is valid, the system accepts it, notifies the user, and a new plan is created based on the command. 
If the command is not valid, the system rejects it, notifies the user, and the robot continues following the original plan without any changes.

This way, the robot can adapt to human input when possible, while making sure the task stays organized and correct thnaks to the Conflict Resolution part of the system.


Activity diagram
++++++++++++++++++++

.. _uml-a-hc:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/activity_diagram.drawio.png
   :alt: Activity diagram
   :align: center
   :width: 60%
   
   Activity diagram for Human Command Monitoring and Conflict Resolution.

.. raw:: html

   <br><br>

The :ref:`activity diagram for Human Command Monitoring and Conflict Resolution <uml-a-hc>` shows how the system handles human commands during task execution.

The process starts when the user (the elder) speaks a command. The system first processes and interprets the command. Then, it checks the current step of the recipe with the Action Planner to decide if the command matches the task or if there is a conflict.

If the command matches the plan, it is accepted, and the Action Planner is notified. The user is then informed that their command was accepted. If the command causes a conflict, the system goes into a conflict resolution phase. It checks if the conflict can be solved without breaking the task. 
If the conflict can be solved, the next action is modified, and the flow continues. Otherwise, the system notifies the user that the command was rejected and keeps following the original plan.

This flow ensures that the robot can adapt to the user's commands when possible, while making sure the main task remains consistent and correct.


State machine diagram
++++++++++++++++++++++++

.. _uml-sm-hc:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/state_machine.drawio.png
   :alt: State Machine diagram
   :align: center
   :width: 60%
   
   State diagram for Human Command Monitoring and Conflict Resolution.

.. raw:: html

   <br><br>
   

Finally, the last behavioural diagram is the :ref:`State diagram for Human Command Monitoring and Conflict Resolution <uml-sm-hc>`. The system starts in the Idle state, waiting for a verbal command from the user. When a command is received, it transitions to the Listening state and then to the Processing Command state, where the command is interpreted and checked against the current task.

Depending on the validation result, the system either moves to the Command Accepted state to notify the user and adjust the plan, or to the Command Rejected state to reject the command and continue with the original plan. After either outcome, the system returns to Idle, ready to process new commands.

This state machine ensures the robot remains reactive while maintaining consistency in the task execution.


Dummy implementation of the cognitive architecture
++++++++++++++++++++++++++++++++++++++++++++++++++++

.. automodule:: human_command.scripts.human_command
   :members:

.. raw:: html

   <br><br>


KPI: Recipe Tracker
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Response time to human command**  
  Measures the time between the moment the elder speaks a command and the robot responds (either by accepting, rejecting, or modifying the plan). A short response time is critical to ensure a natural and fluid human-robot interaction during the cooking task. 
  Ideally, the response time should be under 2–3 seconds to maintain the user's trust and system usability.

- **Conflict resolution accuracy**  
  Evaluates how often the system correctly detects and handles conflicts between human commands and the ongoing task plan. 
  A high conflict resolution accuracy indicates that the robot can identify problematic commands without wrongly rejecting valid requests or accepting risky ones, thus preserving both safety and task coherence.

- **Percentage of commands recognized and interpreted**  
  Refers to the proportion of human commands that are successfully understood and mapped to a valid action or decision in the system. 
  This KPI measures both the quality of command interpretation and the system's flexibility. A high recognition rate (> 90%) is desired to ensure smooth collaboration between the elder and the robot.

