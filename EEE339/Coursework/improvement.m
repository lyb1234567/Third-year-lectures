load 'ECGData1(1).mat'
load 'Hann_Coefficient_FIR.mat'
origin=origSig';
noise=noisySig';

% Ts=10/3599;
% fs=1/Ts;
% time=0:Ts:10;
% plot(time,origin);
% hold on
% filtered_origin_FIR_Hann=filter(Hann_Coefficient,1,origin);
% plot(time,filtered_origin_FIR_Hann);
 t = 0:0.01:1-0.01;
 x = cos(2*pi*10*t)+rand(1,length(t));
 xdft = fft(x);
 plot(abs(xdft));