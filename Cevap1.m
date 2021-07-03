clear;
clc;
clf;

orj_image = imread('odev1.bmp');
subplot(1,2,1);
imshow(orj_image);
title('Orjinal Resim');

red=orj_image(:,:,1);
green=orj_image(:,:,2);
blue=orj_image(:,:,3);
cikti=red>220&green>160&green<220&blue>100&blue<200;

subplot(1,2,2);
imshow(cikti);
title('Yüz Bölgeleri');