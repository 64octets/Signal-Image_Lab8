clear all
close all
clc

load('lab9_data')
fig_index = 1;

x=simple;
x_noise=simple_noise;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(fig_index)
L=7;
bb=ones(L,1)*(1/L);
y1=filter(bb,1,x);
y2=filter2(bb,x,'same');

RMS_x = sqrt(mean((y1-x).^2))
RMS_x2 = sqrt(mean((y2-x).^2)) %introduces less error in the signal
Rx = num2str(RMS_x);
Rx2 = num2str(RMS_x2);
subplot(3,1,1)
stem(x)
title('Reference Signal')
subplot(3,1,2)
stem(y1)
title(['Filtered Signal using "filter" function, RMS=',Rx])
subplot(3,1,3)
stem(y2)
title(['Filtered Signal using "filter2" function, RMS=',Rx2])
fig_index = fig_index + 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(fig_index)
L=7;
bb=ones(L,1)*(1/L);
y=filter2(bb,x_noise,'same');

RMS_noise = sqrt(mean((x_noise-x).^2))
RMS_filterednoise = sqrt(mean((y-x_noise).^2))
RMS_NOISE = RMS_filterednoise - RMS_noise
Rnoise = num2str(RMS_noise);
Rfnoise = num2str(RMS_filterednoise);
R_NOISE = num2str(RMS_NOISE);

subplot(3,1,1)
stem(x)
title('Reference Signal')
subplot(3,1,2)
stem(x_noise)
title(['Noisy Signal, RMS=',Rnoise])
subplot(3,1,3)
stem(y)
title(['Filtered Noisy Signal, RMS=',R_NOISE])
fig_index = fig_index + 1;
%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(fig_index)
L=3;
bb3=ones(L,1)*(1/L);
y3=filter2(bb3,x_noise,'same');
L=5;
bb5=ones(L,1)*(1/L);
y5=filter2(bb5,x_noise,'same');
L=9;
bb9=ones(L,1)*(1/L);
y9=filter2(bb9,x_noise,'same');

RMS_3 = sqrt(mean((y3-x).^2)) %lowest error filtering, slightly larger than RMS_noise
RMS_5 = sqrt(mean((y5-x).^2))
RMS_9 = sqrt(mean((y9-x).^2))
R3 = num2str(RMS_3);
R5 = num2str(RMS_5);
R9 = num2str(RMS_9);

subplot(4,2,1)
plot(x)
title('Reference Signal')
subplot(4,2,3)
plot(y3)
title(['Filtered Signal using "3-point filter", RMS=',R3])
subplot(4,2,5)
plot(y5)
title(['Filtered Signal using "5-point filter", RMS=',R5])
subplot(4,2,7)
plot(y9)
title(['Filtered Signal using "9-point filter", RMS=',R9])

subplot(4,2,4)
stem(bb3)
title('Coefficients of a "3-point filter"')
subplot(4,2,6)
stem(bb5)
title('Coefficients of a "5-point filter"')
subplot(4,2,8)
stem(bb9)
title('Coefficients of a "9-point filter"')

fig_index = fig_index + 1;

%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(fig_index)
bb05=g_smooth(0.5);
y05=filter2(bb05,x,'same');
bb075=g_smooth(0.75);
y075=filter2(bb075,x,'same');
bb1=g_smooth(1.0);
y1=filter2(bb1,x,'same');

RMS_05 = sqrt(mean((y05-x).^2)) %the lowest, and lower than RMS_noise
RMS_075 = sqrt(mean((y075-x).^2))
RMS_1 = sqrt(mean((y1-x).^2))
R05 = num2str(RMS_05);
R075 = num2str(RMS_075);
R1 = num2str(RMS_1);

subplot(3,2,1)
plot(y05)
title(['Width = 0.5, RMS=',R05])
subplot(3,2,3)
plot(y075)
title(['Width = 0.75, RMS=',R075])
subplot(3,2,5)
plot(y1)
title(['Width = 1.0, RMS=',R1])
subplot(3,2,2)
stem(bb05)
title('Coefficients of the "Tapered" filter W=0.5')
subplot(3,2,4)
stem(bb075)
title('Coefficients of the "Tapered" filter W=0.75')
subplot(3,2,6)
stem(bb1)
title('Coefficients of the "Tapered" filter W=1.0')
fig_index = fig_index + 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%

x= simple;
x(20)=250;
x(60)=250;
x(90)=250;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(fig_index)
bb=g_smooth(0.5)
y=filter2(bb,x,'same')

RMS_spiky=sqrt(mean((y-x).^2));
Rspiky = num2str(RMS_spiky);

subplot(2,1,1)
plot(x)
title('Reference Spiky Signal')
subplot(2,1,2)
plot(y)
title(['Filtered Spiky Signal, RMS=',Rspiky])
fig_index = fig_index + 1;

B = medfilt1(x);
figure(fig_index)
subplot(2,1,1);
plot(x)
title('ref signal with spikes');
subplot(2,1,2);
plot(B)
title('spike signal using meadian filter');
%%%%%%%%%%%%%%%%%%%%%%%%%%%