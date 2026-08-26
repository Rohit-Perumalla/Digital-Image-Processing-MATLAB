%% Experiment 4
% Image Enhancement
% Histogram Equalization, Logarithmic Transformation,
% and Gamma Transformation

clc;
clear;
close all;

%% Read and Display Original Image

% Read the input color image
a = imread('tower.jpeg');

% Display the original image
figure;
imshow(a);
title('Original Color Image');

%% Convert Image to Grayscale

% Convert the RGB image to grayscale
b = rgb2gray(a);

% Display the grayscale image
figure;
imshow(b);
title('Grayscale Image');

%% Histogram Equalization

% Perform histogram equalization
% to improve the contrast of the grayscale image
c = histeq(b);

% Display the enhanced image
figure;
imshow(c);
title('Histogram Equalized Image');

% Display the histogram of the enhanced image
figure;
imhist(c);
title('Histogram of Enhanced Image');

%% Logarithmic Transformation

% Convert the image to double precision
% so mathematical operations can be performed
img = im2double(b);

% Scaling constant for logarithmic transformation
d = 10;

% Apply logarithmic transformation
log_img = d * log(1 + img);

% Display the logarithmically transformed image
figure;
imshow(log_img);
title('Logarithmic Transformation');

%% Gamma Transformation

% Set the gamma value
gamma = 0.5;

% Scaling constant
c = 1;

% Apply gamma transformation
gamma_img = c * (img .^ gamma);

% Display the gamma transformed image
figure;
imshow(gamma_img);
title('Gamma Transformation');
