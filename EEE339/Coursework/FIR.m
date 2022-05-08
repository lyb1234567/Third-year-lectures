load 'ECGData1(1).mat'
load 'Hann_Coefficient_FIR.mat'
origin=origSig';
noise=noisySig';
Ts=10/3599;
fs=1/Ts;
time=0:Ts:10;
L=size(origin,2);
f_range= fs*(0:L-1)/L;
f_shift=(-L/2:L/2-1)*(fs/L);


plot(time,origin);
xlabel('time(ms)');
ylabel('original(mv)');
grid on
title('Original signal');

hold on
filtered_noise_FIR_Hann=filter(Hann_Coefficient,1,noise);
plot(time,filtered_noise_FIR_Hann);

figure
origin_fft=fft(origin);
origin_fftshift=fftshift(abs(origin_fft));
subplot(3,1,1);
plot(f_shift,origin_fftshift/max(origin_fftshift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Origin in the frequency domain');



subplot(3,1,2);
noise_fft=fft(noise);
noise_fftshift=fftshift(abs(noise_fft));
plot(f_shift,noise_fftshift/max(noise_fftshift));
xlabel('frequency(Hz)');
ylabel('Amplitude (mV)');
title('Noise in the frequency domain');

subplot(3,1,3)
FIR_fft=fft(filtered_noise_FIR_Hann);
FIR_fft_fftshift=fftshift(abs(FIR_fft));
plot(f_shift,FIR_fft_fftshift/max(FIR_fft_fftshift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('filtered noise using FIR in the frequency domain');

figure
[h_FIR,f_FIR]=freqz(Hann_Coefficient,1,'whole',2001,fs);
N_FIR=round(0.5*length(h_FIR));
plot(f_FIR(1:N_FIR),20*log10(abs(h_FIR(1:N_FIR))));
xlabel('Frequency (Hz)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of FIR filter');

