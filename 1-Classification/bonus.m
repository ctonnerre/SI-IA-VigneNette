% prise en main : utilisation d'un cnn existant
% Activit� bonus : afficher les 5 tops scores

% charge le r�seau neuronal
net = alexnet;  
% montre comment voir les propri�t�s de la couche d'entr�e
% y compris la taille d'image que le CNN attend
net.Layers(1)

% r�cup�ration de toutes les classes
classNames = net.Layers(end).ClassNames; 

%lit l'image  la charge en m�moire en tableau de pixels
img = imread('panda.jpeg'); 
% mise � la taille input du r�seau
img =  imresize(img,[227,227]);  
% on r�cup�re le label + donne le temps d'ex�cution dans la command window
tic
[label, scores] = classify(net, img);  
toc
% Affichage de l'image
figure(1)  %cr�e la fen�te d'affichage
imshow(img, 'InitialMagnification', 'fit')% affiche l'image
title(string(label) + ", " + num2str(100*scores(classNames == label), '%.2f') + "%"); 

% affiche les 5 plus fortes probabilit�s
% Trie par score d�croissant 
[~,idx] = sort(scores,'descend');
% s�lectionne les 5 plus forts indices
idx = idx(5:-1:1);
% r�cup�re les classes et les scores pour ces indices
classNamesTop = net.Layers(end).ClassNames(idx);
scoresTop = scores(idx);
% affiche une nouvelle figure avec un graphique en barres
figure(2)
barh(scoresTop)
xlim([0 1])
title('Top 5 des pr�dictions')
xlabel('Probabilit�')
yticklabels(classNamesTop)

