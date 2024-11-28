clear;
clc;
close all;

% Load and convert the woods image
I = imread('/MATLAB Drive/assets/woods.png');
I = im2double(I);

% Create Gaussian filter
sigma = 1.5;
mask_size = 6*ceil(sigma)+1;
gaussian = fspecial('gaussian', [mask_size mask_size], sigma);

% Initialize the pyramid
laplacian_pyramid = cell(1, 3);
current_image = I;

% Create the Laplacian pyramid
figure;
for level = 1:3
    % Smooth the current image
    smoothed = conv2(current_image, gaussian, 'same');
    
    % Calculate Laplacian (difference between original and smoothed)
    laplacian_pyramid{level} = current_image - smoothed;
    
    % Display the Laplacian result
    subplot(1, 3, level);
    imagesc(laplacian_pyramid{level});
    colormap('gray');
    colorbar;
    title(['Level ' num2str(level)]);
    
    % Prepare for next level if not at the last level
    if level < 3
        current_image = imresize(smoothed, 0.5, 'nearest');
    end
end

% Get the last level of the pyramid
last_level = laplacian_pyramid{3};

% Extract the requested pixel values
value1 = last_level(5, 9);  % row=5, column=9
value2 = last_level(2, 2);  % row=2, column=2

% Display the values with 4 decimal places
disp(['Value at row=5, column=9: ', num2str(value1, '%.4f')]);
disp(['Value at row=2, column=2: ', num2str(value2, '%.4f')]);
