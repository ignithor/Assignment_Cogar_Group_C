.. Assignment_Cogar_Group_C documentation master file, created by
   sphinx-quickstart on Wed Apr 23 16:14:16 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Assisting elderly individuals in meal preparation
==================================================================

Welcome to the documentation of the first assignment of Cognitive Architecture.

This project is the work of **Group C** on **Topic 3**:

- BEAUJEAN Bertille, S7899816
- PHAM DANG Paul, S7899827
- ROYANT Emma, Sxxxxxxx

In this document, you will find a description of the software architecture that we designed to assist elder people in cooking tasks with a TIAGo robot.

The documentation will outline the specifications of the assignment, then present the architecture implementation of the given solution through its component diagram. Each component of the system will be described and illustrated with relevant behavioural diagrams. Thereafter, the integration testing KPIs will be presented.

.. toctree::
   :maxdepth: 2
   :caption: Contents:



Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

Assignment: Topic 3
=====================================

blablabla This is the description of the assignment

Presentation of the architecture
======================================

blablabla This is the architecture component diagram with accurate description detailing where different design
patters could play a role in the final architecture implementation.

Add a png of the component diagram.

The components
================

Recipe Tracking and Execution History
*****************************************

.. automodule:: Assignment_Cogar_Group_C.src.recipe_tracking.scripts.recipe_tracking
   :members:

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/activity_diagram_V2.drawio.png
   :alt: Activity diagram
   :align: center
   :width: 60%

.. raw:: html

   <br><br>

.. image:: https://raw.githubusercontent.com/ignithor/Assignment_Cogar_Group_C/refs/heads/main/src/recipe_tracking/diagrams/state_diagram.png
   :alt: State Machine diagram
   :align: center
   :width: 60%

Action Planning Based on Cooking State and Task History
*********************************************************

.. automodule:: Assignment_Cogar_Group_C.src.action_planning.scripts.action_planning
   :members:

Human Command Monitoring and Conflict Resolution
***************************************************

.. automodule:: Assignment_Cogar_Group_C.src.human_command.scripts.human_command
   :members:

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
