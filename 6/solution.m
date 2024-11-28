clear; clc; close all;

% Load and convert the elephant image
img = imread('/MATLAB Drive/assets/elephant.png');
img = im2double(img);

% Parameters for Gabor filters
sigma = 3;
lambda = 0.1;
gamma = 0.75;
orientations = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165];
responses = cell(length(orientations), 1);

% Compute responses for each orientation
for i = 1:length(orientations)
    gabor0 = gabor2(sigma, lambda, orientations(i), gamma, 0);
    gabor90 = gabor2(sigma, lambda, orientations(i), gamma, 90);
    response0 = conv2(img, gabor0, 'valid');
    response90 = conv2(img, gabor90, 'valid');
    responses{i} = sqrt(response0.^2 + response90.^2);
end

% Combine responses by taking the maximum at each pixel location
[rows, cols] = size(responses{1});
combined_response = zeros(rows, cols);
for i = 1:length(orientations)
    combined_response = max(combined_response, responses{i});
end

% Display the combined complex cell response image
figure;
imagesc(combined_response);
colormap('gray');
colorbar;
title('Combined Complex Cell Responses');

% Extract and display the requested pixel values
value1 = combined_response(290, 292); % row=290, column=292
value2 = combined_response(331, 147); % row=331, column=147

fprintf('Values from combined response:\n');
fprintf('Value at row=290, column=292: %.4f\n', value1);
fprintf('Value at row=331, column=147: %.4f\n', value2);
clear; clc; close all;

% Load and convert the elephant image
img = imread('/MATLAB Drive/assets/elephant.png');
img = im2double(img);

% Parameters for Gabor filters
sigma = 3;
lambda = 0.1;
gamma = 0.75;
orientations = [0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165];
responses = cell(length(orientations), 1);

% Compute responses for each orientation
for i = 1:length(orientations)
    gabor0 = gabor2(sigma, lambda, orientations(i), gamma, 0);
    gabor90 = gabor2(sigma, lambda, orientations(i), gamma, 90);
    response0 = conv2(img, gabor0, 'valid');
    response90 = conv2(img, gabor90, 'valid');
    responses{i} = sqrt(response0.^2 + response90.^2);
end

% Combine responses by taking the maximum at each pixel location
[rows, cols] = size(responses{1});
combined_response = zeros(rows, cols);
for i = 1:length(orientations)
    combined_response = max(combined_response, responses{i});
end

% Display the combined complex cell response image
figure;
imagesc(combined_response);
colormap('gray');
colorbar;
title('Combined Complex Cell Responses');

% Extract and display the requested pixel values
value1 = combined_response(290, 292); % row=290, column=292
value2 = combined_response(331, 147); % row=331, column=147

fprintf('Values from combined response:\n');
fprintf('Value at row=290, column=292: %.4f\n', value1);
fprintf('Value at row=331, column=147: %.4f\n', value2);
