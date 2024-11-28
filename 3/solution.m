clear all; close all; clc;

laplacian = [-1/8 -1/8 -1/8;
             -1/8  1   -1/8;
             -1/8 -1/8 -1/8];

woods = imread('/MATLAB Drive/assets/woods.png');
woods = im2double(woods);

sigma1 = 1.5;
sigma2 = 5.0;

size1 = ceil(6*sigma1) + 1;
size2 = ceil(6*sigma2) + 1;

gaussian1 = fspecial('gaussian', [size1 size1], sigma1);
gaussian2 = fspecial('gaussian', [size2 size2], sigma2);

log1 = conv2(gaussian1, laplacian, 'same'); 
log2 = conv2(gaussian2, laplacian, 'same');

figure;

% Show mesh plots of LoG masks
subplot(2,2,1);
mesh(log1);
title('LoG Mask (\sigma = 1.5)');
colorbar;
axis tight;

subplot(2,2,2);
mesh(log2);
title('LoG Mask (\sigma = 5.0)');
colorbar;
axis tight;

% Convolve woods image with LoG masks
response1 = conv2(woods, log1, 'same');
response2 = conv2(woods, log2, 'same');

% Display convolution results
subplot(2,2,3);
imagesc(response1);
colormap('gray');
colorbar;
title('Woods * LoG (\sigma = 1.5)');
axis('off', 'equal', 'tight');

subplot(2,2,4);
imagesc(response2);
colormap('gray');
colorbar;
title('Woods * LoG (\sigma = 5.0)');
axis('off', 'equal', 'tight');

% Extract and display pixel values with proper formatting (4 decimal places)
disp('LoG (σ = 1.5) values:');
disp(['row=169, column=4: ' num2str(response1(169, 4), '%.4f')]);
disp(['row=134, column=13: ' num2str(response1(134, 13), '%.4f')]);

disp('LoG (σ = 5.0) values:');
disp(['row=169, column=4: ' num2str(response2(169, 4), '%.4f')]);
disp(['row=134, column=13: ' num2str(response2(134, 13), '%.4f')]);
