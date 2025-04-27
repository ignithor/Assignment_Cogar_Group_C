Assisting elderly individuals in meal preparation
=================================================

Welcome to the documentation of the first assignment of Cognitive Architecture.

This project is the work of **Group C** on **Topic 3**:

- BEAUJEAN Bertille, S7899816
- PHAM DANG Paul, S7899827
- ROYANT Emma, S8552743

In this document, you will find a description of the software architecture that we designed to assist elder people in cooking tasks with a TIAGo robot.

The documentation will outline the specifications of the assignment, then present the architecture implementation of the given solution through its component diagram. Each component of the system will be described and illustrated with relevant behavioural diagrams. Thereafter, the integration testing KPIs will be presented.


Presentation of the desired system (Topic 3)
-------------------------------------------------

This project aims to give assistance to elderly individuals in meal preparation, by helping them in the kitchen in the cooking tasks with the robot TIAGo.

The robot TIAGo is equipped with RGB-D Camera, LiDAR, SONAR, Force Sensors, Microphones, and Speakers.

The architecture should enable the robot to do the following tasks:

- **Ingredient retrieval** - the robot retrieves ingredients from the shelf, planning an efficient and obstacle-free path using vision and real-time environment mapping.
- **Collaborative cooking process** - the robot collaborates with the elderly person, executing the recipe step by step (mixing, cutting, pouring). Keeps track of the recipe and cooking progress, updating internal representation of the task.
- **Action decision-making** - at each step, the robot determines the next action based on previous steps and current state. Verifies verbal commands (e.g., “Pass me the spoon”) and checks if they align with the planned sequence.
- **Verbal command handling** - if a verbal command conflicts with the planned process, the robot must decide whether to override the plan or reject the request.
- **Object recognition** -TIAGo should recognize objects (tools, ingredients) in the environment.

- **Mission completion** - once the recipe is completed, the robot notifies the user that the meal preparation is finished and ensures that all steps have been followed correctly.

To precise the functions required for this robot, here under is the :ref:`use case diagram <uml-ucd>` of the system:

.. _uml-ucd:

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/assignments/diagrams/use_case_diagram.drawio.png
   :alt: Use case diagram (global)
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

In this diagram, the two actors considered are the user (an elder person) and the robot TIAGo. In the process of assisting the elder, the diagram illustrrates that the elder should be able to take the ingredients and execute the recipe while making verbal requests to the robot. In order to give assistance, the robot should be able to take the ingredients and execute the recipe instead of the user and adapt wisely its behaviour according to the recipe, the requests of the user.

To do so, the documentation will focus particularly on the description of the architecture of three components:

-  :ref:`recipe-tracking`: Maintains an updated internal representation of the recipe and the sequence of performed actions. Ensures the cooking process follows the correct step-by-step execution. Provides necessary data to determine the next best action.
- :ref:`action-planning`: Decides the next action based on the current cooking progress and past steps. Considers the state of the system, ensuring seamless task progression. Dynamically adjusts the sequence in response to unexpected conditions.
- :ref:`human-command`: Recognizes and interprets verbal commands related to object passing or ingredient addition. Evaluates whether a request fits within the expected sequence of actions. If a command is valid, it modifies the plan accordingly. If it is incorrect, the robot rejects the request and follows the original plan.


Presentation of the architecture
--------------------------------

.. _uml-c:

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/assignments/diagrams/component_diagram.drawio.png
   :alt: Component diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

The global architecture of the system is described by the following :ref:`component diagram <uml-c>`. 
The robot is equipped with various sensors and services, such as an RGB-D Camera, LiDAR, SONAR, force sensors, microphones, and speakers. The architecture is designed so that these components work together seamlessly to support the meal preparation process.

The process begins with the **Recipe Tracking and Execution History Subsystem** and the **Human Command Monitoring and Conflict Resolution Subsystem**. The Recipe Tracking Subsystem maintains an internal representation of the recipe and the sequence of actions performed, ensuring that each step is followed correctly. The Human Command Monitoring Subsystem captures verbal commands from the user through microphones and evaluates their alignment with the meal preparation plan. It resolves any conflicts, ensuring the robot can adapt to user input while maintaining task integrity.

Both of these subsystems feed information to the **Action Planning Subsystem**, which determines the next steps based on the current state of meal preparation and the history of actions taken. This planning is dynamic, adjusting to unexpected conditions or verbal commands from the user.

Once the Action Planning Subsystem decides on the next action, it relies on the **Perception Subsystem** to execute it. The Perception Subsystem uses the RGB-D Camera to capture depth and RGB images, allowing it to map the environment in real-time and recognize objects. This data is crucial for the **Navigation Subsystem**, which plans efficient and obstacle-free paths using LiDAR for precise navigation and SONAR for measuring distances.

Finally, the **Robot Subsystem** comes into play, using force sensors and arm joints to handle tools and ingredients with precision. This subsystem executes the commands decided by the Action Planning Subsystem, ensuring that the robot can navigate the environment, recognize and manipulate objects, and interact with the user to ensure a smooth and safe meal preparation process.

Throughout this process, the subsystems work together, sharing data and coordinating actions to provide a cohesive and adaptive system for meal preparation assistance.


.. toctree::
   :maxdepth: 2

   recipe_tracking
   action_planning
   human_command


Indices and tables
------------------

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`