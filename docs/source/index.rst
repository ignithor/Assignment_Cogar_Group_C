.. Cogar Assignments documentation master file, created by
   sphinx-quickstart on Thu Apr  3 10:45:37 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Cogar Assignments documentation
===============================

This repository contains the code and materials for the `Assignment_Cogar` project.  
You can find the `Assignment_Cogar GitHub Repository <https://github.com/AleBulanti/Assignment_Cogar.git>`.

Repository Structure
--------------------

- **src/**
  
  Contains the `assignments` ROS package, which includes Python service nodes.
  All services are presented together, but they are organized by assignments as follows:

  - **Assignment 1 Services:**
    - `victim_report_service.py`
    - `risk_evaluation_service.py`
    - `mission_status_service.py`

  - **Assignment 2 Services:**
    - `arm_motion_service.py`
    - `notifications_service.py`
    - `mission_status_service.py` 

  - **Assignment 3 Services:**
    - `mission_status_service.py` 
    - `interprete_command_service.py`
    - `resolve_conflict_service.py`

- **srv/**

  Contains all custom ROS service definitions, categorized per assignment:

  - **Assignment 1 Services:**
    - `victim_report.srv`
    - `risk_evaluation.srv`
    - `mission_status.srv`

  - **Assignment 2 Services:**
    - `mission_status.srv` 
    - `notifications.srv`
    - `CheckJointState.srv`

  - **Assignment 3 Services:**
    - `mission_status.srv`
    - `ResolveConflict.srv`
    - `InterpreterCommand.srv`

- **doc/**

  Includes documentation materials and reference content used to write this documentation.

- **tiago_data/**

  Contains sensor data recorded from the TIAGo robot.  
  Each dataset represents inputs captured from one specific sensor, including:
  
  - RGB-D Camera
  - LiDAR
  - SONAR
  - Force Sensors
  - Microphones
  - Speakers
  - Odometry
  - Joint State


.. toctree::
   :maxdepth: 2
   :caption: Contents:

