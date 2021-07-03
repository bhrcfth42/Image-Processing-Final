clear;
clc;
clf;

orj_image = rgb2gray(imread('odev4.bmp'));

closed_morphology_image = bwmorph(orj_image,'close');

subplot(1,2,1);
imshow(orj_image);
title('Orjinal Resim');

subplot(1,2,2);
imshow(closed_morphology_image);
title('Binary Morfoloji Closed');