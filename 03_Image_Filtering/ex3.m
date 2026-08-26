%% Experiment 3
% Image Filtering
% Smoothing Filter and Edge Detection

clc;
clear;
close all;

%% Read and Display Original Image

% Read the input image
a = imread('charlie.jpeg');

% Display the original image
figure;
imshow(a);
title('Original Image');

%% Convert Image to Grayscale

% Convert the RGB image to grayscale
b = rgb2gray(a);

% Display the grayscale image
figure;
imshow(b);
title('Grayscale Image');

% Display pixel information
impixelinfo;

%% Design a 3x3 Smoothing Filter

% Create a 3x3 average filter
% Each value is 1/9 so that the total filter weight is 1
sf = (1/9) * [1 1 1;
              1 1 1;
              1 1 1];

%% Design a Vertical Edge Detection Filter

% Create a filter for detecting vertical edges
hf = [1  0 -1;
      1  0 -1;
      1  0 -1];

%% Apply Smoothing Filter

% Convert the grayscale image to double precision
% before applying convolution
smoothI = conv2(double(b), sf, 'same');

% Display the smoothed image
figure;
imshow(uint8(smoothI));
title('Smoothed Image');

%% Apply Edge Detection Filter

% Apply the vertical edge detection filter
edgeI = conv2(double(b), hf, 'same');

% Display the edge-detected image
figure;
imshow(uint8(abs(edgeI)));
title('Vertical Edge Detection');
