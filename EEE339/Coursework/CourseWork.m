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

%plot the fft figure of noise and origin

%fft of noise
noise_fft=fft(noise);
noise_fft_shift=fftshift(abs(noise_fft));
L=size(noise,2);

%fft of origin
origin_fft=fft(origin);
origin_fft_shift=fftshift(abs(origin_fft));

figure
f_range= fs*(-L/2:(L-1)/2)/L;
subplot(2,1,1);
plot(f_range,noise_fft_shift/max(noise_fft_shift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Noise in the frequency domain');

subplot(2,1,2);
plot(f_range,origin_fft_shift/max(origin_fft_shift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Original signal in the frequency domain');




