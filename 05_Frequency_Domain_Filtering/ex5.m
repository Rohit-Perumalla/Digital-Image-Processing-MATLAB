%% Experiment 5
% Design Low-Pass and High-Pass Filters
% in the Frequency Domain

clc;
clear;
close all;

%% Read and Display Original Image

% Read the grayscale input image
I = imread('cameraman.tif');

% Display the original image
figure;
imshow(I);
title('Original Image');

%% Convert Image to Double

% Convert the image to double precision
% for frequency-domain calculations
I_double = double(I);

%% Fourier Transform

% Transform the image from spatial domain
% to frequency domain
F = fft2(I_double);

% Shift the zero-frequency component
% to the center of the spectrum
Fshift = fftshift(F);

%% Display Fourier Magnitude Spectrum

% Calculate the magnitude spectrum using
% logarithmic scaling for better visualization
mag = log(1 + abs(Fshift));

% Display the Fourier magnitude spectrum
figure;
imshow(mat2gray(mag));
title('Fourier Transform Magnitude (Log Scale)');

%% Design Ideal Low-Pass Filter

% Get the image dimensions
[rows, cols] = size(I);

% Find the center of the frequency domain
center_row = floor(rows / 2);
center_col = floor(cols / 2);

% Create coordinate matrices
[X, Y] = meshgrid(1:cols, 1:rows);

% Calculate the distance of each point
% from the center of the frequency domain
dist = sqrt((X - center_col).^2 + ...
           (Y - center_row).^2);

% Set the cutoff radius
radius = 50;

% Create the Ideal Low-Pass Filter
% Frequencies inside the radius are passed
H = double(dist <= radius);

% Display the filter mask
figure;
imshow(H, []);
title('Ideal Low-Pass Filter');

%% Apply Low-Pass Filter

% Multiply the Fourier spectrum by the
% low-pass filter
Gshift = Fshift .* H;

% Shift the frequency spectrum back
G = ifftshift(Gshift);

% Perform inverse Fourier transform
filtered = ifft2(G);

% Display the low-pass filtered image
figure;
imshow(real(filtered), []);
title('Filtered Image (Low-Pass)');

%% Apply High-Pass Filter

% Create the high-pass filter by subtracting
% the low-pass filter from 1
Gshift1 = Fshift .* (1 - H);

% Shift the frequency spectrum back
G1 = ifftshift(Gshift1);

% Perform inverse Fourier transform
filtered1 = ifft2(G1);

% Display the high-pass filtered image
figure;
imshow(real(filtered1), []);
title('Filtered Image (High-Pass)');
