#!/usr/bin/env python3

import unittest
import rospy
import rostest
from assignments.msg import stepAction, stepGoal, stepResult
from actionlib import SimpleActionClient, SimpleActionServer
from actionlib_msgs.msg import GoalStatus
from recipe_tracking import RecipeTrackingNode


class ActionServerSimulator:
    """
    Simule un serveur d'action pour le test.
    """

    def __init__(self, name):
        self._action_server = SimpleActionServer(
            name, stepAction, execute_cb=self.execute_callback, auto_start=False
        )
        self._action_server.start()

    def execute_callback(self, goal):
        """
        Simule l'exécution de l'action.
        Si l'action réussit, le résultat est marqué comme succès, sinon comme échec.
        """
        result = stepResult()
        if goal.action == "cutting":
            result.success = True  # Simuler un succès pour "cutting"
        else:
            result.success = False  # Simuler un échec pour les autres actions

        self._action_server.set_succeeded(result)


class TestRecipeTrackingNode(unittest.TestCase):

    def setUp(self):
        rospy.init_node('test_recipe_tracking', anonymous=True)

        # Créer un serveur d'action simulé
        self.server_simulator = ActionServerSimulator('/step_action')

        # Création d'un client d'action
        self.client = SimpleActionClient('/step_action', stepAction)
        self.assertTrue(self.client.wait_for_server(timeout=rospy.Duration(10)))

        # Initialiser le nSud à tester
        self.recipe_node = RecipeTrackingNode()

        # Remplacer le client d'action dans le nSud avec celui créé pour le test
        self.recipe_node.step_client = self.client

    def test_step_tracking_success(self):
        """
        Test d'un scénario où une étape réussie est traitée correctement.
        """
        # Simuler l'envoi d'un objectif
        goal = stepGoal(action="cutting", ingredient="carrots")
        self.recipe_node.step_client.send_goal(goal)
        
        # Attendre le résultat
        self.recipe_node.step_client.wait_for_result()

        # Vérifier que le résultat est bien un succès
        result = self.recipe_node.step_client.get_result()
        self.assertTrue(result.success)

        # Simuler le comportement de la boucle step_tracking
        self.recipe_node.recipe_checklist = {
            "action": ["cutting", "pouring", "mixing", "end"],
            "ingredient": ["carrots", "water", "all", None],
            "success": [False, False, False, False]
        }
        self.recipe_node.current_step = {"action": "cutting", "ingredient": "carrots", "success": False}

        # Appeler la méthode step_tracking
        self.recipe_node.step_tracking()

        # Vérifier si l'état de la recette a bien été mis à jour
        self.assertTrue(self.recipe_node.recipe_checklist["success"][0])  # La première étape devrait être marquée comme réussie

    def test_step_tracking_failure(self):
        """
        Test d'un scénario où une étape échoue et la checklist est mise à jour en conséquence.
        """
        # Simuler l'envoi d'un objectif
        goal = stepGoal(action="pouring", ingredient="water")
        self.recipe_node.step_client.send_goal(goal)
        
        # Attendre le résultat
        self.recipe_node.step_client.wait_for_result()

        # Vérifier que le résultat est un échec
        result = self.recipe_node.step_client.get_result()
        self.assertFalse(result.success)

        # Simuler le comportement de la boucle step_tracking
        self.recipe_node.recipe_checklist = {
            "action": ["cutting", "pouring", "mixing", "end"],
            "ingredient": ["carrots", "water", "all", None],
            "success": [False, False, False, False]
        }
        self.recipe_node.current_step = {"action": "pouring", "ingredient": "water", "success": False}

        # Appeler la méthode step_tracking
        self.recipe_node.step_tracking()

        # Vérifier que l'étape n'est pas marquée comme réussie
        self.assertFalse(self.recipe_node.recipe_checklist["success"][1])  # La deuxième étape ne doit pas être marquée comme réussie

    def tearDown(self):
        """
        Nettoyage après chaque test
        """
        self.recipe_node.step_client.shutdown()
        self.server_simulator._action_server.shutdown()


if __name__ == '__main__':
    rostest.rosrun('recipe_tracking', 'test_recipe_tracking_node', TestRecipeTrackingNode)

