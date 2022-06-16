% prise en main : utilisation d'un cnn existant
% pour obtenir le label (classe la plus probable)
% et les scores des classes

net = alexnet;  % Charge le r�seau neuronal AlexNet
% Alexnet a �t� entra�n� sur 1000 classes
% les noms des classes sont stock�es dans la derni�re couche
classNames = net.Layers(end).ClassNames; % r�cup�ration des noms des classes

%lit l'image  la charge en m�moire
img1 = imread('panda.jpeg'); 
%This image was originally posted to Flickr by popofatticus at https://www.flickr.com/photos/49503214348@N01/2478623520. It was reviewed on 10 August 2008 by FlickreviewR and was confirmed to be licensed under the terms of the cc-by-2.0.

img2 = imread('grape.jpg');
% mise � la taille input du r�seau
img1 =  imresize(img1,[227,227]);  
img2  = imresize(img2,[227,227]);

%r�cup�ration du label (classe la plus probable) de l'image 
% et des scores pour chaque classes
[label1, scores1] = classify(net, img1);  
[label2, scores2] = classify(net, img2);  

figure(1)  %cr�e la fen�te d'affichage
imshow(img1, 'InitialMagnification', 'fit')% affiche l'image
% met le label en titre
title(string(label1) + ", " + num2str(100*scores1(classNames == label1), '%.2f') + "%"); 
%image2 : affichage de l'image et du label
figure(2)
imshow(img2, 'InitialMagnification', 'fit')% affiche l'image
title(string(label2) + ", " + num2str(100*scores2(classNames == label2), '%.2f') + "%");  

