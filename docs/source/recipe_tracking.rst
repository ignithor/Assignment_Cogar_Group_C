Recipe Tracking and Execution History
=======================================

This section describes the architecture of the "Recipe Tracking and Execution History" component, based on its behavioural diagrams (use case diagram, sequence diagram, activity diagram, and state machine diagram).

Use Case Diagram
-----------------

.. _uml-uc-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/use_case_diagram.png
   :alt: Use case diagram
   :align: center
   :width: 60%

   Use case diagram for recipe tracking and execution history.

As illustrated in the :ref:`use case diagram for recipe tracking and execution history <uml-uc-rt>`, the main use cases of the component are to go from one step of the recipe to another, while validating those which have been executed properly.

This component interacts once directly with the elder person: the recipe has to be selected by this actor so that it can work. Afterwards, the only external interaction is with the Action Planner, to communicate the goal step and whether it is reached or not.

It operates with two principal objects:

- The **Step by step recipe checklist**, which corresponds to a checklist of the steps of the recipe. This way, it represents the memory of the steps already executed.
- The **Step tracker**, which stores the data of the current step and updates it every time its execution is validated by the Action Planner.

Interfaces with Other Components
---------------------------------

As illustrated in the :ref:`use case diagram <uml-uc-rt>`, the only interface of this component with another component is with the Action Planner.

It is a data interface, exposing the data of the current step of the recipe. It is loosely-typed with an action planning which has the following structure:

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

Thus, a step is represented by a verb of **action** ("cutting", "pouring", "mixing") and an **ingredient** ("carrots", "leeks", "cheese", etc.), which are defined by the Recipe tracker and acquired by the Action Planner, and the **success** status (boolean) to know if the step has succeeded. The string type enables formalizing the spoken language with token words which can be understood and spoken naturally both by the robot and an elder person.

It is a stateless interface which forgets about the previous data it had as soon as the data of a new step is sent. Indeed, the dependence between the different steps is already dealt with by the fact that the steps are validated one by one and in order. So, for the interface, the success of a step can be considered independent of the success of the previous ones.

Finally, the concerns are separated such that this recipe tracker can be initialized independently from the other components.

Sequence Diagram
-----------------

.. _uml-seq-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/sequence_diagram.png
   :alt: Sequence diagram
   :align: center
   :width: 80%

   Sequence diagram for recipe tracking and execution history.

In the :ref:`sequence diagram for recipe tracking and execution history <uml-seq-rt>`, we can again point out the role of the elder, which is to select the recipe and notify it to this component to set the recipe checklist accordingly and enable recipe tracking.

The loop guarantees that we continuously check that the current step is not the last one (by convention, the recipe should end by the step "end"). Such that, while the recipe is not over, the step tracker will keep checking with the Action Planner if the current step that it is sharing has been executed successfully.

In case the current step has been executed, and only in this case, the step tracker will notify the recipe checklist that the current step is validated and get the following step in return, as a new current step.

The sequence either terminates when reaching the "end" step of the recipe, or loops until getting the validation from the Action Planner. Errors are treated by the Action Planner, so the non-termination of the sequence (infinite loop) would be a problem to be solved by the Action Planner.

Activity Diagram
-----------------

.. _uml-a-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/activity_diagram.png
   :alt: Activity diagram
   :align: center
   :width: 100%

   Activity diagram for recipe tracking and execution history.

The :ref:`activity diagram for recipe tracking and execution history <uml-a-rt>` can be partitioned into two swimlanes.

First, the swimlane of **"User interaction"** is initiated with the selection of a recipe by the user (the elder). Once the component received a valid recipe from the user, the recipe checklist (*RecipeControl*, a dictionary of the steps and their validation status) and the current step (*step*, from an action planning, composed of a string for the action to do, a string for the ingredient to use and a boolean for the validation status of the step), are initialized. The partition ends with an edge, to mark the initialization of the two previous objects.

Then, the second swimlane **"Recipe tracking"** begins with a join control: the flow reaches the first action only when the edge of the User interaction is reached (*RecipeControl* and *current_step* exist), and when a signal is received from the Action Planner, notifying that the current step has been successfully executed. Only then, the execution history is updated (the current step is validated in *RecipeControl*), then the current step is updated (*current_step* takes the data of the next step in the recipe checklist *RecipeControl*).

If the updated current step is the "end" step, the activity is completely terminated. Otherwise, the flow is ended and might be initiated again if a new signal is sent.

State Machine Diagram
----------------------

.. _uml-sm-rt:

.. figure:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/state_diagram.png
   :alt: State machine diagram
   :align: center
   :width: 100%

   State diagram for recipe tracking and execution history.

Finally, the last behavioural diagram presented is the :ref:`state machine for recipe tracking and execution history <uml-sm-rt>`. One may note that the :ref:`activity diagram <uml-a-rt>` was more appropriate for this component: there are only two different states defined and one of them represents the **Idle** phase, when the cooking process is initialized (recipe checklist and current step). This is due to the fact that, with this architecture, the component is constantly checking whether the current step has been executed or not. There is no "waiting" state.

The first state **Idle** is the initialization phase. It checks the validity of the recipe file provided when entering the state, then creates and initializes the recipe checklist, and finally initializes the current step to the first step when leaving the state.

Then the second state represents **Step tracking**. The success of the current step is repetitively checked, until it becomes true. In this case, the state is entered via another entry, to validate the current step in the recipe checklist, then go to the next step, exit all states if the "end" step is reached or send the new step to the action planner otherwise. After checking the success status of the current step for both entries, the state has two different exits, if the step succeeded or not yet.

Dummy Implementation of the Cognitive Architecture
---------------------------------------------------

.. automodule:: recipe_tracking.scripts.recipe_tracking
   :members:

KPI: Recipe Tracker
--------------------

To indicate whether this component is meeting performance goals, the chosen metrics aim at measuring its capacity to know at what step of the recipe the cooking process currently is. That is to say that we can assess:

- The response time relative to the "current" time. If this duration is too long, it would make the whole control of the robot longer as the robot should wait longer to receive a command. This corresponds to the duration between the time when the Robot finishes the step and the time when the Recipe Tracker is notified that the step has succeeded. A relevant indicator would be the mean and standard deviation of this duration over the steps. For security matters in the meal preparation, an acceptable duration would be under 0.2s, which is the average reaction time for a human with full abilities and would prevent risks of accidents, for example with the cutting action.
- The accuracy of the execution history. With the current architecture, the execution history is supposed to show which steps of the recipe were validated. A relevant indicator would be to check its accuracy, false positive ratio, and false negative ratio, and study it by action (cutting, pouring, mixing) and ingredient. An accuracy above 0.9 is expected and particularly a false positive ratio under 0.05. The false negative ratio should be reasonably low but it would cause fewer troubles in the cooking process to do a step without knowing than not to do a step and keep on with the recipe.

*To assess the accuracy of the Execution history, let's recall and state that the validation status of a step can change if and only if it is the current step and if the Action Planner sends the information that it has succeeded. As the current step changes to the following when it is validated, consequently, if a step is validated, then all the previous steps are also validated. One may think of modifying the answer of the Action Planner, to enable a third validation state (True, False, Abort), and go to the next step when the current step is not "False" anymore.*
