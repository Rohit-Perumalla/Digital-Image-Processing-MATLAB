%% Experiment 6
% Image Restoration
% Salt-and-Pepper Noise Removal Using Median Filtering
% Performance Evaluation using SNR, PSNR, and SSIM

clc;
clear;
close all;

%% Read Original Image

% Read the built-in MATLAB sample image
I = imread("cameraman.tif");

%% Add Salt-and-Pepper Noise

% Add salt-and-pepper noise with noise density of 0.05
noisyImage = imnoise(I, "salt & pepper", 0.05);

%% Remove Noise Using Median Filter

% Apply a 3x3 median filter to remove the noise
restoredImage = medfilt2(noisyImage, [3, 3]);

%% Display Original, Noisy, and Restored Images

figure;

% Display original image
subplot(1, 3, 1);
imshow(I);
title("Original Image");

% Display noisy image
subplot(1, 3, 2);
imshow(noisyImage);
title("Noisy Image");

% Display restored image
subplot(1, 3, 3);
imshow(restoredImage);
title("Restored Image");

%% Calculate SNR

% Calculate Signal-to-Noise Ratio
snr_value = snr(double(I), ...
                double(restoredImage) - double(I));

%% Calculate PSNR

% Calculate Peak Signal-to-Noise Ratio
psnr_value = psnr(restoredImage, I);

%% Calculate SSIM

% Calculate Structural Similarity Index
ssim_value = ssim(restoredImage, I);

%% Display Results

fprintf("SNR = %.2f dB\n", snr_value);
fprintf("PSNR = %.2f dB\n", psnr_value);
fprintf("SSIM = %.4f\n", ssim_value);
