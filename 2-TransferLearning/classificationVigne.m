% Test de r�utilisation du cnn obtenu
% classification d'images

% charge le fichier Matlab contenant le cnn obtenu par transfer learning
load VigneNetteCnn.mat
% charge le cnn dans une variable
net = vignenette;  % Charge le r�seau neuronal 

% r�cup�ration des noms des classes
% les noms des classes sont stock�es dans la derni�re couche
classNames = net.Layers(end).ClassNames; 

%lit l'image  la charge en m�moire
img = imread('grape_esca.jpg'); 

% mise � la taille input du r�seau
img =  imresize(img,[224,224]);  

%r�cup�ration du label (classe la plus probable) de l'image 
% et des scores pour chaque classes
[label, scores] = classify(net, img);  

figure(1)  %cr�e la fen�te d'affichage
imshow(img, 'InitialMagnification', 'fit')% affiche l'image
% met le label en titre
title(string(label) + ", " + num2str(100*scores(classNames == label), '%.2f') + "%"); 
 

