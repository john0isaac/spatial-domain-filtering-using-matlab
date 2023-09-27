% Read Image for Noise Addition
img=imread('lena.bmp');
% Mask Definition
laplacian_varient_filter=[1 1 1; 1 -8 1; 1 1 1]
% Convolve the image read
% in 'img' with Laplacian mask.
sharpended_image=conv2(img, laplacian_varient_filter, 'same');

figure;
subplot(1,3,1);
imshow(img);
title('Original image')

subplot(1,3,2);
imshow(uint8(sharpended_image));
title('Laplacian Fitlered image')

subplot(1,3,3);
imshow(img-uint8(sharpended_image));
title('Sharpended image')
