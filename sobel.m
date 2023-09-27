% Read Image for Noise Addition
img=imread('lena.bmp');

% Convert the image to double
double_img = double(img);

% Pre-allocate the filtered_image matrix with zeros
filtered_image = zeros(size(double_img));

% Sobel Operator Mask
Mx = [-1 0 1; -2 0 2; -1 0 1];
My = [-1 -2 -1; 0 0 0; 1 2 1];

% Edge Detection Process
% When i = 1 and j = 1, then filtered_image pixel
% position will be filtered_image(2, 2)
% The mask is of 3x3, so we need to traverse
% to filtered_image(size(input_image, 1) - 2
%, size(input_image, 2) - 2)
% Thus we are not considering the borders.
for i = 1:size(double_img, 1) - 2
    for j = 1:size(double_img, 2) - 2

        % Gradient approximations
        Gx = sum(sum(Mx.*double_img(i:i+2, j:j+2)));
        Gy = sum(sum(My.*double_img(i:i+2, j:j+2)));

        % Calculate magnitude of vector
        filtered_image(i+1, j+1) = sqrt(Gx.^2 + Gy.^2);

    end
end

% Define a threshold value
thresholdValue = 100; % varies between [0 255]
output_image = max(filtered_image, thresholdValue);
output_image(output_image == round(thresholdValue)) = 0;


figure;
subplot(1,3,1);
imshow(img);
title('Original image')

subplot(1,3,2);
imshow(uint8(filtered_image));
title('Sobel Fitlered image')

subplot(1,3,3);
imshow(im2bw(output_image));
title('Edge Detected Image');
