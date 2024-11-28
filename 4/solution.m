% Clear workspace
clear all; close all; clc;

% Define the Laplacian mask as given
laplacian = [-1/8 -1/8 -1/8;
             -1/8  1   -1/8;
             -1/8 -1/8 -1/8];

% Create sufficiently large mask size for all operations
sigma_log = 4.0;
mask_size = 2 * ceil(3 * max([sigma_log, 6])) + 1;  % Using largest sigma (6) for size

% Create LoG mask with sigma = 4.0
gaussian_log = fspecial('gaussian', [mask_size mask_size], sigma_log);
log_mask = conv2(gaussian_log, laplacian, 'same');
log_mask = log_mask./max(max(log_mask));

% Create initial DoG mask with sigma = 3 and sigma = 6
gaussian1 = fspecial('gaussian', [mask_size mask_size], 3);
gaussian2 = fspecial('gaussian', [mask_size mask_size], 6);
dog_mask = gaussian1 - gaussian2;
dog_mask = dog_mask./max(max(dog_mask));

% Systematic search for best matching sigmas
best_distance = inf;
best_sigma1 = 0;
best_sigma2 = 0;

% Search with steps of 0.10
for sigma1 = 0.1:0.1:10  % Extended range to ensure we don't miss the best match
    for sigma2 = (sigma1 + 0.1):0.1:10
        % Create DoG mask
        gaussian1 = fspecial('gaussian', [mask_size mask_size], sigma1);
        gaussian2 = fspecial('gaussian', [mask_size mask_size], sigma2);
        dog_mask = gaussian1 - gaussian2;
        dog_mask = dog_mask./max(max(dog_mask));
        
        % Calculate distance using the exact formula given
        distance = sqrt(sum(sum((dog_mask - log_mask).^2)));
        
        % Update best match if better
        if distance < best_distance
            best_distance = distance;
            best_sigma1 = sigma1;
            best_sigma2 = sigma2;
        end
    end
end

% Display results
fprintf('Best match found with:\n');
fprintf('Smaller standard deviation = %.4f\n', best_sigma1);
fprintf('Larger standard deviation = %.4f\n', best_sigma2);
fprintf('Distance measure = %.4f\n', best_distance);
