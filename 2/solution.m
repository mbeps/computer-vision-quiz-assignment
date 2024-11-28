% Clear workspace and command window
clear all; close all; clc;

% Read the image
img = imread('/MATLAB Drive/assets/rooster.jpg');

% Convert to double (0-1 range)
img = im2double(img);

% Extract color channels
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Calculate Yellow as average of Red and Green
Yellow = (R + G) / 2;

% Create Gaussian filter
% Use mask size that's 6 times the standard deviation for proper coverage
sigma = 2.75;
mask_size = 2 * ceil(3 * sigma) + 1;  % Ensures odd size
fprintf('Mask size used: %dx%d\n', mask_size, mask_size);

% Create the Gaussian filter
gaussian = fspecial('gaussian', [mask_size mask_size], sigma);

% Convolve both yellow and blue channels with Gaussian
% Use 'same' to maintain input image size
yellow_response = conv2(Yellow, gaussian, 'same');
blue_response = conv2(B, gaussian, 'same');

% Calculate final response (Yellow-on, Blue-off)
color_opponent_response = yellow_response - blue_response;

% Display the result
figure;
imagesc(color_opponent_response);
colormap('gray');
colorbar;
axis image;  % Maintain aspect ratio
title('Blue-off, Yellow-on Color-Opponent Cell Response');

% Get values at specified locations
value1 = color_opponent_response(184, 15);
value2 = color_opponent_response(133, 293);

fprintf('Value at row=184, column=15: %.4f\n', value1);
fprintf('Value at row=133, column=293: %.4f\n', value2);
