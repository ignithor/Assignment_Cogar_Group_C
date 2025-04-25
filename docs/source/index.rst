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
-------------------

blablabla This is the description of the assignment

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

KPI: Recipe Tracker
~~~~~~~~~~~~~~~~~~~

The components
--------------

Recipe Tracking and Execution History
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. automodule:: recipe_tracking.scripts.recipe_tracking
   :members:

.. raw:: html

   <br><br>

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/activity_diagram.png
   :alt: Activity diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/state_diagram.png
   :alt: State Machine diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/sequence_diagram.png
   :alt: Sequence diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

Action Planning Based on Cooking State and Task History
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. automodule:: action_planning.scripts.action_planning
   :members:

.. raw:: html

   <br><br>

KPI: Action Planning
~~~~~~~~~~~~~~~~~~~~

Human Command Monitoring and Conflict Resolution
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. automodule:: human_command.scripts.human_command
   :members:

.. raw:: html

   <br><br>

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/activity_diagram.drawio.png
   :alt: Activity diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/sequence_diagram.drawio.png
   :alt: Sequence diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/human_command/diagrams/state_machine.drawio.png
   :alt: State Machine diagram
   :align: center
   :width: 60%


KPI: Human Command Handling
~~~~~~~~~~~~~~~~~~~~~~~~~~~

- **Response time to human command**
- **Conflict resolution accuracy**
- **Percentage of commands recognized and interpreted**
