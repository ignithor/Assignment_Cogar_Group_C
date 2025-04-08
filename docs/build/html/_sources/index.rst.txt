.. Cogar Assignments documentation master file, created by
   sphinx-quickstart on Thu Apr  3 10:45:37 2025.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Cogar Assignments documentation
===============================

This repository contains the code and materials for the `Assignment_Cogar` project.  


Repository Structure
--------------------

- **src/**
  
  Contains the `assignments` ROS package, which includes Python service nodes.
  All services are presented together, but they are organized by assignments as follows:

  - **Topic 1 Services:**
    - `victim_report_service.py`
    - `risk_evaluation_service.py`
    - `mission_status_service.py`

  - **Topic 2 Services:**
    - `arm_motion_service.py`
    - `notifications_service.py`
    - `mission_status_service.py` 

  - **Topic 3 Services:**
    - `mission_status_service.py` 
    - `interprete_command_service.py`
    - `resolve_conflict_service.py`


- **srv/**

  Contains all custom ROS service definitions, categorized per topics:

  
  - **Topic 1 .srv:**
    - `VictimReport.srv`
    - `RiskEvaluation.srv`
    - `MissionStatus.srv`

  - **Topic 2 .srv:**
    - `MissionStatus.srv` 
    - `Notifications.srv`
    - `CheckJointState.srv`

  - **Topic 3 .srv:**
    - `Missionstatus.srv`
    - `ResolveConflict.srv`
    - `InterpreterCommand.srv`


- **doc/**

  Includes documentation materials and reference content used to write this documentation.

- **TIAGo .bag**

  Below are the data collected in bags from the TIAGo sensors, which can be found on OneDrive.
  Each bag represents inputs captured from one specific sensor, including:

  
  - RGB-D Camera: Depth raw images, RGB raw images.
  - LiDAR: Environment point cloud.
  - SONAR: Distance measurements, usually for nearby objects.
  - Force Sensors: Force and Torque measurementsof the right arm.
  - Microphones: Sound inputs. Not provided as bag.
  - Speakers: Audio output. Not provided as bag.
  - Odometry: Provides the robot's current position and velocity.
  - Arm Joint State: Includes information about the robot's limb, such as positions, velocities, and effort. 



.. toctree::
   :maxdepth: 2
   :caption: Contents:

