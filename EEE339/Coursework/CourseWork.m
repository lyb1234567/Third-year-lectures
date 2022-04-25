load 'ECGData1(1).mat'
origin=origSig';
noise=noisySig';


Ts=10/3599;
fs=1/Ts;
time=0:Ts:10;

subplot(4,2,1)
plot(time,origin);
xlabel('time(ms)');
ylabel('original(mv)');
grid on
title('Original signal')
origin_fft=fft(origin);
origin_fftshift=fftshift(abs(origin_fft));
L=size(origin,2);
f_range= fs*(0:L-1)/L;
f_shift=(-L/2:L/2-1)*(fs/L);
subplot(4,2,2)
plot(f_shift,origin_fftshift/max(origin_fftshift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Origin in the frequency domain');

subplot(4,2,3)
plot(time,noise);
xlabel('time(ms)');
ylabel('noise(mv)');
title('Noise Signal');
noise_fft=fft(noise);
noise_fftshift=fftshift(abs(noise_fft));
L=size(noise,2);
f_range= fs*(0:L-1)/L;
f_shift=(-L/2:L/2-1)*(fs/L);

subplot(4,2,4)
plot(f_shift,noise_fftshift/max(noise_fftshift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Noise in the frequency domain');



fd=60;
Wn=(fd)/(0.5*fs);
[b1 a1]= butter(20,Wn,'low');
filtered_noise = filter(b1,a1,noise); 
subplot(4,2,5);
plot(time,filtered_noise);
xlabel('time(ms)');
ylabel('filtered noise(mv)');
title('Filtered noise using IIR')
filtered_noise_fft=fft(filtered_noise);
filtered_noise_fftshift=fftshift(abs(filtered_noise_fft));
subplot(4,2,6);
plot(f_shift,filtered_noise_fftshift/max(filtered_noise_fftshift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('filtered noise using IIR in the frequency domain');

[b2 a2]= fir1(20,Wn);
filtered_noise_FIR = filter(b2,a2,noise); 
subplot(4,2,[7 8]);
plot(time,filtered_noise_FIR);
xlabel('time(ms)');
ylabel('filtered noise(mv)');
title('Filtered noise using FIR');

figure 
[h,f] = freqz(b1,a1,'whole',2001,fs);
N=round(0.5*length(h));
plot(f(1:N)/fs,20*log10(abs(h(1:N))));
xlabel('Normalized Frequency (f/fs)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of IIR filter');

figure 
plot(time,origin);
hold on
plot(time,filtered_noise);
plot(time,filtered_noise_FIR);
xlabel('time(ms)');
ylabel('Signal')
legend('Original signal','Filtered noise using IIR','Filtered noise using FIR');