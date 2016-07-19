clear all; clc;
fid = fopen('soundout1.dat','r');
y1 = fscanf(fid,'%x');
y = y1;
y(y>32767)=y(y>32767)-65536;
y = y/32768;
y = y(1:32000);
% wavwrite(y,8000,16,'soundout.wav');
n = length(y);
NFFT = 2^nextpow2(n); % Next power of 2 from length of x
X = fft(y,NFFT);
fs = 8000;ff = (1:NFFT/2+1)*fs/NFFT;
plot(ff,abs(X(1:NFFT/2+1))/max(abs(X(1:NFFT/2+1))));
sound(y,8000,16);
