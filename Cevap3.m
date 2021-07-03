clear;
clc;
clf;

orj_image = imread('odev3.bmp');
MSI=ones(3);

yeni_image=zeros(size(orj_image)-2);
for i=1:size(orj_image,1)-2
    for j=1:size(orj_image,2)-2
        Temp=double(orj_image(i:i+2,j:j+2)).*MSI;
        yeni_image(i,j)=median(Temp(:));
    end
end

subplot(1,2,1);
imshow(orj_image);
title('Orjinal Resim');

subplot(1,2,2);
imshow(uint8(yeni_image));
title('MSI Sonucu');