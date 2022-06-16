% Test de réutilisation du cnn obtenu
% classification d'images

% charge le fichier Matlab contenant le cnn obtenu par transfer learning
load VigneNetteCnn.mat
% charge le cnn dans une variable
net = vignenette;  % Charge le réseau neuronal 

% récupération des noms des classes
% les noms des classes sont stockées dans la dernière couche
classNames = net.Layers(end).ClassNames; 

%lit l'image  la charge en mémoire
img = imread('grape_esca.jpg'); 

% mise à la taille input du réseau
img =  imresize(img,[224,224]);  

%récupération du label (classe la plus probable) de l'image 
% et des scores pour chaque classes
[label, scores] = classify(net, img);  

figure(1)  %crée la fenête d'affichage
imshow(img, 'InitialMagnification', 'fit')% affiche l'image
% met le label en titre
title(string(label) + ", " + num2str(100*scores(classNames == label), '%.2f') + "%"); 
 

