close all;
clear all;
clc;

opengl software;

i = 1;

img1 = imread('peppers.tif'); % clear image
figure(i);
subplot(1,2,1);
imagesc(img1);
colormap(gray);

img2 = imread('peppers_noise1.tif'); % noisy image
subplot(1,2,2);
imagesc(img2);
colormap(gray);

i = i+1;

figure(i);
subplot(1,3,1);
imagesc(img1);
title('original image');

subplot(1,3,2);
imagesc(img2);
title('noisy image');
bb= g_smooth2(5);
f1 = filter2(bb,img2,'same');
subplot(1,3,3);
imagesc(f1)
title('noisy image smoothed by filter');


