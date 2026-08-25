%% Experiment 2
% Basic Image Processing
% Image Reading, Grayscale Conversion, Cropping,
% Rotation, RGB Channels, and 4D Data

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

%% Convert RGB Image to Grayscale

% Convert the color image into a grayscale image
b = rgb2gray(a);

% Display the grayscale image
figure;
imshow(b);
title('Grayscale Image');

%% Display Pixel Information

% Display pixel information when moving the mouse
% over the image
impixelinfo;

%% Image Cropping

% Crop a selected region from the grayscale image
c = b(49:159, 52:149);

% Display the cropped image
figure;
imshow(c);
title('Cropped Image');

%% Image Rotation

% Transpose the cropped image
d = c';

% Transpose again to obtain the original orientation
g = d';

% Display the rotated/transposed image
figure;
imshow(d);
title('Transposed Image');

% Display the restored image
figure;
imshow(g);
title('Restored Orientation');

%% Display Images in Sequence

% Resize the transposed image
e = imresize(d, [111, 98]);

% Join the cropped and resized images horizontally
f = horzcat(c, e);

% Display the combined image
figure;
imshow(f);
title('Images Displayed in Sequence');

%% Divide Image into RGB Channels

% Extract the Red channel
red = a(:, :, 1);

% Extract the Green channel
green = a(:, :, 2);

% Extract the Blue channel
blue = a(:, :, 3);

% Reconstruct the color image using RGB channels
cI = cat(3, red, green, blue);

% Display all RGB channels and the reconstructed image
figure;

subplot(1, 4, 1);
imshow(red);
title('Red Channel');

subplot(1, 4, 2);
imshow(green);
title('Green Channel');

subplot(1, 4, 3);
imshow(blue);
title('Blue Channel');

subplot(1, 4, 4);
imshow(cI);
title('Color Image');

%% Create 4D Data

% Combine RGB channel data into a 4D array
img4D = cat(4, red, green, blue);

% Display the 4D data slices
figure;

subplot(1, 3, 1);
imshow(img4D(:, :, :, 1));
title('4D Slice - Red');

subplot(1, 3, 2);
imshow(img4D(:, :, :, 2));
title('4D Slice - Green');

subplot(1, 3, 3);
imshow(img4D(:, :, :, 3));
title('4D Slice - Blue');

%% Display Size of 4D Data

disp('Size of 4D Data:');
disp(size(img4D));
