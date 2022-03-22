load 'ECGData1(1).mat'
origin=origSig';
noise=noisySig';


Ts=10/3599;
fs=1/Ts;
time=0:Ts:10;

figure
plot(time,origin);
xlabel('time(s)');
ylabel('original(mv)')

figure
plot(time,noise);
xlabel('time(s)');
ylabel('noise(mv)');

figure
noise_fft=fft(noise);
L=size(noise,2);
f_range= fs*(0:L-1)/L;
plot(f_range,abs(noise_fft));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Noise in the frequency domain');





