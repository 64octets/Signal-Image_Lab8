close all;
clear all;
clc;

load lab9_data;
fig_ind=1;
x = simple;

L=7; % 7 point running average filter
bb = ones(L,1)*1/L;
y1= filter(bb,1,x);
y2 = filter2(bb,x,'same');
figure(fig_ind);
subplot(3,1,1);
stem(x);
title('ref signal');
subplot(3,1,2);
stem(y1);
title('filtered signal using "filter" function');
subplot(3,1,3);
stem(y2);
title('filtered signal using "filter2" function');
rms1 = sqrt(mean(y1-x).^2)
rms2 = sqrt(mean(y2-x).^2)

fig_ind= fig_ind+1;

x2=simple_noise;
L=7; % 7 point running average filter
bb = ones(L,1)*1/L;
y3= filter(bb,1,x2);
y4 = filter2(bb,x2,'same');

figure(fig_ind);
subplot(3,1,1);
stem(x);
title('ref signal');
subplot(3,1,2);
stem(x2);
title('noisy signal');
subplot(3,1,3);
stem(y4);
title('filtered signal using "filter2" function');
rms3 = sqrt(mean(x2-x).^2)
