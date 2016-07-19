clear all; clc;
% 取原始数据
[x,f1]=wavread('sound1234.wav');
x = x(:,1);
x = resample(x,8000,f1);      %y的长度34738
%处理数据,并将数据存入indata.dat中
% % normal = x/max(x);
% % indata = round(32767*normal);   %32767是7FFF
% % indata(indata<0) = indata(indata<0)+65536;
% % teml = fopen('sound1234_data.dat','w');
% % fprintf(teml,'1651 1\r\n');
% % fprintf(teml,'%#X\r\n',indata);
% % fclose(teml);
% 求原始数据频谱
n = length(x);
NFFT = 2^nextpow2(n); % Next power of 2 from length of x
X = fft(x,NFFT);
fs = 8000;ff = (1:NFFT/2+1)*fs/NFFT;
% 加单频(f1)噪声,并求加噪数据的频谱
f1 = 3000; t = (1:n)';
m = sin(2*pi*f1*t/fs);
x2 = 0.1*m + x;      %输入信噪比SNR = 10log(2.55)=4.1dB
wavwrite(x2,fs,16,'sound_noise.wav');
X2 = fft(x2,NFFT);
%处理加噪数据，并存入nindata.dat
% % normal_1 = x2/max(x2);
% % n_indata = round(32767*normal_1);
% % n_indata(n_indata<0) = n_indata(n_indata<0)+65536;
% % t1 = fopen('sound_noise.dat','w');
% % fprintf(t1,'1651 1\r\n');
% % fprintf(t1,'%#X\r\n',n_indata);
% % fclose(t1);
%作图
f = 1;
figure(f);
subplot(2,2,1);
plot([0:n-1]/fs,x);
axis([0,n/fs,-0.4,0.4]);
xlabel('时间(s)');
ylabel('幅度');
title('原始信号波形');
subplot(2,2,2);
plot(ff,abs(X(1:NFFT/2+1))/max(abs(X(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('频率(Hz)');
ylabel('归一化幅度');
title('原始信号频谱');
subplot(2,2,3);
plot([0:n-1]/fs,x2);
axis([0,n/fs,-0.4,0.4]);
xlabel('时间(s)');
ylabel('幅度');
title('加噪信号波形');
subplot(2,2,4);
plot(ff,abs(X2(1:NFFT/2+1))/max(abs(X2(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('频率(Hz)');
ylabel('归一化幅度');
title('加噪信号频谱');

z = filter_50(x2);
Z = fft(z,NFFT);
figure(f+1);
subplot(2,2,1);
plot([0:n-1]/fs,x);
axis([0,n/fs,-0.4,0.4]);
xlabel('时间(s)');
ylabel('幅度');
title('原始信号波形');
subplot(2,2,2);
plot(ff,abs(X(1:NFFT/2+1))/max(abs(X(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('频率(Hz)');
ylabel('归一化幅度');
title('原始信号频谱');
subplot(2,2,3);
plot([0:n-1]/fs,z);
axis([0,n/fs,-0.4,0.4]);
xlabel('时间(s)');
ylabel('幅度');
title('FIR滤波后信号波形');
subplot(2,2,4);
plot(ff,abs(Z(1:NFFT/2+1))/max(abs(Z(1:NFFT/2+1))));
xlim([0,4000]);
xlabel('频率(Hz)');
ylabel('归一化幅度');
title('FIR滤波后信号频谱');