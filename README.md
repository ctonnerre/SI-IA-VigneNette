# SI-IA-VigneNette
Support formation IA : DeepLearning Matlab détection maladie de la vigne

Vous trouverez tous les fichiers de mise en oeuvre de deep learning (transfer learning) avec Matlab pour l'application VigneNette.
Toute la documentation est sur le [cloud Canoprof ](https://tonnerre.canoprof.fr/eleve/Ressources-SI/IA%20VigneNette%20(D%C3%A9tection%20des%20maladies%20sur%20les%20feuilles%20de%20vigne%20-%20Deep%20Learning%20avec%20Matlab))

Pour une découverte de l'IA, il est conseillé de prendre les fichiers dans l'ordre
- 1-classification : utilisation d'un réseau de neurones existant dans Matlab pour se familiariser avec les cnn. 
  - Obtention du label d'une image par script
  - Obtention des classes les plus probables, affichage des scores
  - Création d'une IHM pour obtenir le label d'une image
- 2-transfer learning : réentraînement du cnn GoogleNet sur les images de feuilles de vigne
  - Création du nouveau réseau à partir de GoogleNet et entraînement
  - Utilisation du Deep Network Designer (interface graphique pour les réseaux de neurones)
  - Comment enregistrer et réutiliser le réseau obtenu
  - Les problèmatiques de temps de calcul, comment utiliser un sous-ensemble d'images

à venir : fichiers concernant la simulation et le déploiement sur Rapsberry Pi 4 + caméré

L'objectif est d'embarquer l'application sur la Raspberry Pi. La Raspberry prend une image toutes les secondes, et affiche le label. 
