% Read Image for Noise Addition
img=imread('lena.bmp');
% Add Noise
Noi_img = imnoise(img,'salt & pepper', 0.02);
% Apply medfilt2 function
de_noi=medfilt2(Noi_img,[3 3]);

figure;
subplot(1,3,1);
imshow(img);
title('Original image')

subplot(1,3,2);
imshow(Noi_img);
title('Noisy image')

subplot(1,3,3);
imshow(uint8(de_noi));
title('Denoised image')
