% Read Image for Noise Addition
img=imread('lena.bmp');
% Add Noise
Noi_img = imnoise(img,'salt & pepper', 0.02);
% Mask Definition
f=1/16*[1,2,1;2,4,2;1,2,1];
% Apply filter2 function
de_noi=filter2(f,Noi_img);

figure;
subplot(1,3,1);
imshow(img);
title('Original image')

subplot(1,3,2);
imshow(Noi_img);
title('Noisy image')

subplot(1,3,3);
%Normalizae and Display
imshow(uint8(de_noi));
title('Denoised image')
