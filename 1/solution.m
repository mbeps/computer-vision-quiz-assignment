clear;           
clc;             
close all;       

Ic = imread('/MATLAB Drive/assets/woods.png');
Icd = im2double(Ic);

maskSize = 21;  
g1 = fspecial('gaussian', maskSize, 1.5);
g2 = fspecial('gaussian', maskSize, 3.0);
dog = g1 - g2;

Icdog = conv2(Icd, dog, 'same');

pixel_value = Icdog(101, 151);
fprintf('Pixel value at row=101, column=151: %.4f\n', pixel_value);

max_shift = 30;
corr_coeffs = zeros(1, max_shift + 1);  

corr_coeffs(1) = corr2(Icdog, Icdog);

for shift = 1:max_shift
    I_shifted = Icdog(shift+1:end, :);  
    I_base = Icdog(1:end-shift, :);     
    corr_coeffs(shift + 1) = corr2(I_base, I_shifted);  
end

fprintf('Correlation at 3 pixel shift: %.4f\n', corr_coeffs(4));   
fprintf('Correlation at 22 pixel shift: %.4f\n', corr_coeffs(23)); 

figure;
subplot(2,1,1);
imagesc(Icdog);
colormap('gray');
colorbar;
title('DoG Response');
xlabel('Column');
ylabel('Row');

subplot(2,1,2);
plot(0:max_shift, corr_coeffs, '-o');
xlabel('Vertical Shift (pixels)');
ylabel('Correlation Coefficient');
title('Correlation vs Shift');
grid on;
