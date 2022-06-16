% prise en main : utilisation d'un cnn existant
% Activité bonus : afficher les 5 tops scores

% charge le réseau neuronal
net = alexnet;  
% montre comment voir les propriétés de la couche d'entrée
% y compris la taille d'image que le CNN attend
net.Layers(1)

% récupération de toutes les classes
classNames = net.Layers(end).ClassNames; 

%lit l'image  la charge en mémoire en tableau de pixels
img = imread('panda.jpeg'); 
% mise à la taille input du réseau
img =  imresize(img,[227,227]);  
% on récupère le label + donne le temps d'exécution dans la command window
tic
[label, scores] = classify(net, img);  
toc
% Affichage de l'image
figure(1)  %crée la fenête d'affichage
imshow(img, 'InitialMagnification', 'fit')% affiche l'image
title(string(label) + ", " + num2str(100*scores(classNames == label), '%.2f') + "%"); 

% affiche les 5 plus fortes probabilités
% Trie par score décroissant 
[~,idx] = sort(scores,'descend');
% sélectionne les 5 plus forts indices
idx = idx(5:-1:1);
% récupére les classes et les scores pour ces indices
classNamesTop = net.Layers(end).ClassNames(idx);
scoresTop = scores(idx);
% affiche une nouvelle figure avec un graphique en barres
figure(2)
barh(scoresTop)
xlim([0 1])
title('Top 5 des prédictions')
xlabel('Probabilité')
yticklabels(classNamesTop)

