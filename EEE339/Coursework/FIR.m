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
ylabel('Amplitude(mv)');
grid on
title('Filtered Noise using FIR');

hold on
filtered_noise_FIR_Hann=filter(Hann_Coefficient,1,noise);
plot(time,filtered_noise_FIR_Hann);
legend('Original','FIR filtered');

figure
plot(time,origin);
hold on
fd=60;
Wn=(fd)/(0.5*fs);
[b1 a1]= butter(17,Wn,'low');
filtered_noise = filter(b1,a1,noise); 
plot(time,filtered_noise);
grid on
legend('Original','IIR filtered');
xlabel('time(ms)');
ylabel('Amplitude(mv)');
title('Filtered Noise using IIR');

figure
origin_fft=fft(origin);
origin_fftshift=fftshift(abs(origin_fft));
subplot(3,1,1);
plot(f_shift,origin_fftshift/max(origin_fftshift));




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

figure
origin_fft=fft(origin);
origin_fftshift=fftshift(abs(origin_fft));
filtered_noise_fft=fft(filtered_noise);
filtered_noise_fftshift=fftshift(abs(filtered_noise_fft));
origin_freq=origin_fftshift/max(origin_fftshift);
noise_freq=filtered_noise_fftshift/max(filtered_noise_fftshift);
plot(f_shift,noise_freq);
xlabel('frequency(Hz)');
ylabel('V_noise/V_origin');
title('Change between original signal and filtered noise using IIR');

figure 
plot(time,noise);
xlabel('time(ms)');
ylabel('Amplitude(mV)');
title('Noise');

figure
origin_fft=fft(origin);
origin_fftshift=fftshift(abs(origin_fft));
filtered_noise_Hann_fft=fft(filtered_noise_FIR_Hann);
filtered_noise_Hann_fftshift=fftshift(abs(filtered_noise_Hann_fft));
origin_freq=origin_fftshift/max(origin_fftshift);
noise_freq=filtered_noise_Hann_fftshift/max(filtered_noise_Hann_fftshift);
plot(f_shift,noise_freq);
xlabel('frequency(Hz)');
ylabel('Amplitude (mv)');
title('Change between original signal and filtered noise using FIR');




