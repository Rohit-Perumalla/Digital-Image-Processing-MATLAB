%% Experiment 7
% High-Boost Filtering of a Color Image
% Image Smoothing and High-Boost Filtering

clc;                    % Clear Command Window
clear;                  % Clear all variables from Workspace
close all;              % Close all open figure windows

%% Read and Display Original Image

% Read the input color image
I = imread("peppers.png");

% Display the original color image
figure;
imshow(I);
title('Original Color Image');

%% Convert Image to Double

% Convert the image to double precision
% Pixel values will be in the range 0 to 1
i_d = im2double(I);

%% Extract RGB Channels

% Extract the Red channel
r = i_d(:,:,1);

% Extract the Green channel
g = i_d(:,:,2);

% Extract the Blue channel
b = i_d(:,:,3);

%% Create Averaging Filter

% Create a 5x5 averaging filter
h = fspecial('average', [5 5]);

%% Smooth the Complete Color Image

% Apply the averaging filter to the complete image
% 'replicate' preserves the border pixel values
imsmooth = imfilter(i_d, h, 'replicate');

% Display the smoothed color image
figure;
imshow(imsmooth);
title('Color Blurred Image');

%% High-Boost Filtering Parameter

% Set the high-boost filtering parameter
a = 1.8;

%% High-Boost Filtering of Red Channel

% Blur the Red channel
r_blur = imfilter(r, h, 'replicate');

% Apply high-boost filtering
r_hbf = a * r - r_blur;

%% High-Boost Filtering of Green Channel

% Blur the Green channel
g_blur = imfilter(g, h, 'replicate');

% Apply high-boost filtering
g_hbf = a * g - g_blur;

%% High-Boost Filtering of Blue Channel

% Blur the Blue channel
b_blur = imfilter(b, h, 'replicate');

% Apply high-boost filtering
b_hbf = a * b - b_blur;

%% Limit Pixel Values

% Limit the Red channel values between 0 and 1
r_hbf = max(min(r_hbf, 1), 0);

% Limit the Green channel values between 0 and 1
g_hbf = max(min(g_hbf, 1), 0);

% Limit the Blue channel values between 0 and 1
b_hbf = max(min(b_hbf, 1), 0);

%% Combine Filtered RGB Channels

% Combine the three filtered RGB channels
highboost = cat(3, r_hbf, g_hbf, b_hbf);

%% Display RGB Channels and High-Boost Image

figure;

% Display Red channel
subplot(1,4,1);
imshow(r);
title('Red Channel');

% Display Green channel
subplot(1,4,2);
imshow(g);
title('Green Channel');

% Display Blue channel
subplot(1,4,3);
imshow(b);
title('Blue Channel');

% Display High-Boost filtered image
subplot(1,4,4);
imshow(highboost);
title('High-Boost Image');

%% Display Final High-Boost Image

% Display the final high-boost filtered color image
figure;
imshow(highboost);
title('Final High-Boost Filtered Color Image');
