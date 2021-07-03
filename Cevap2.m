clear;
clc;
clf;

[X]=imread('odev2.bmp');
resim=double(X);
subplot(3,3,1);
imshow(X,[0,255]);
title('Orjinal Resim');
satir=size(resim,1);
sutun=size(resim,2);

for level=1:256
    histo(level)=0;
    for i=1:satir
        for j=1:sutun
            if resim(i,j)==level-1
                histo(level)=histo(level)+1;
            end
        end
    end
end

subplot(2,3,2);
stem(histo,'Color','b','Marker','none');
title('Orjinal Resim Histogram');
axis([0 255 0 20000])

for level=1:256
    transfer(level)=0;
    for m=1:level-1
        transfer(level)=transfer(level)+histo(m+1)/(satir.*sutun);
    end
end

subplot(2,3,3);
h=plot(transfer);
set(h,'color','red');
grid;
axis([1 256 0 1])
title('Orjinal Resmin Transfer Fonksiyonu');
hold on;

p=max(transfer(:));
for level=1:256
    for i=1:satir
        for j=1:sutun
            if resim(i,j)==level-1
                yeni_resim(i,j)=round((transfer(level)/p)*255);
            end
        end
    end
end

subplot(2,3,4);
imshow(yeni_resim,[0 255]);
title('Histogram Eşitlenmiş Resim');

for k=1:256
    yeni_hist(k)=0;
    for i=1:size(yeni_resim,1)
        for j=1:size(yeni_resim,2)
            if yeni_resim(i,j)==k-1
                yeni_hist(k)=yeni_hist(k)+1;
            end
        end
    end
end

subplot(2,3,5);
stem(yeni_hist,'Color','b','Marker','none');
title('Yeni Resim Histogram');
axis([0 255 0 20000])

for level=1:256
    yeni_transfer(level)=0;
    for m=1:level-1
        yeni_transfer(level)=yeni_transfer(level)+yeni_hist(m+1)/(satir.*sutun);
    end
end

subplot(2,3,3);
h=plot(yeni_transfer);
set(h,'color','green');
grid;
axis([1 256 0 1])
title('Yeni Resmin Transfer Fonksiyonu');
hold off;