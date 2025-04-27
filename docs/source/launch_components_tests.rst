.. _launch_components_tests:


Launch Components and Tests
=================================

This document describes how to launch the components and tests of the ROS nodes.

Launch Components
---------------------------------

To launch the components, you can use the following command:

```
roslaunch assignments super_launch.launch
```

This launch file launches all the necessary nodes for the project. The following nodes are included:

speaker_service (package: assignments)

arm_motion_service (package: assignments)

perception_server (package: assignments)

path_planning_server (package: assignments)

recipe_tracking_node (package: recipe_tracking)

action_planning_node (package: action_planning)

human_command_node (package: human_command)

And set the default parameter to the recipe file:

recipe_txt : $(find assignments)/recipes/recipe.txt

Running integration tests
---------------------------------


To run the integration tests, you can use the following command:

for testing the recipe tracking node:

```
rostest recipe_tracking test_recipe_tracking.test
```

for testing the action planning node:

```
rostest action_planning test_action_planning_node.test
```

for testing the human command node:

```
rostest human_command test_human_command_node.test
```


