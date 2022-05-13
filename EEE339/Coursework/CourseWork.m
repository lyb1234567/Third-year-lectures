load 'ECGData1(1).mat'
load 'Hanning_Coefficient.mat'
load 'Equirl_Coefficient.mat'
origin=origSig';
noise=noisySig';


Ts=10/3599;
fs=1/Ts;
time=0:Ts:10;

figure
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
A=origin_fftshift/max(origin_fftshift);
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
title(['Noise in the frequency domain' '    Mains Hum:' num2str(f_shift(3151)) 'Hz']);
hold on
C=noise_fftshift/max(noise_fftshift);
plot(f_shift(3151),C(3151),'^','Color','r','MarkerFaceColor','r');
legend('Noise','Mains Hum');

fd=60;
Wn=(fd)/(0.5*fs);
[b1 a1]= butter(17,Wn,'low');
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
D=filtered_noise_fftshift/max(filtered_noise_fftshift);
filtered_noise_FIR_Equirr = filter(Coefficient_Equirr,1,noise); 
filtered_noise_FIR_Hann=filter(Num,1,noise);
subplot(4,2,7);
plot(time,filtered_noise_FIR_Equirr);
xlabel('time(ms)');
ylabel('filtered noise(mv)');
title('Filtered noise using FIR');

subplot(4,2,8);
FIR_fft=fft(filtered_noise_FIR_Equirr);
FIR_fft_fftshift=fftshift(abs(FIR_fft));
plot(f_shift,FIR_fft_fftshift/max(FIR_fft_fftshift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('filtered noise using FIR in the frequency domain');



figure 
[h_FIR_Hann,f_FIR_Hann]=freqz(Num,1,'whole',2001,fs);
N_FIR_Hann=round(0.5*length(h_FIR_Hann));
plot(f_FIR_Hann(1:N_FIR_Hann),20*log10(abs(h_FIR_Hann(1:N_FIR_Hann))));
xlabel('Normalized Frequency (f/fs)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of FIR filter with Hanning');

figure 
[h_FIR_Equirr,f_Equirr]=freqz(Coefficient_Equirr,1,'whole',2001,fs);
N_FIR_Equirr=round(0.5*length(h_FIR_Equirr));
plot(f_Equirr(1:N_FIR_Equirr),20*log10(abs(h_FIR_Equirr(1:N_FIR_Equirr))));
xlabel('Normalized Frequency (f/fs)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of FIR filter with Equirriple');

figure 
[h_IIR,f_IIR] = freqz(b1,a1,'whole',2001,fs);
N_IIR=round(0.5*length(h_IIR));
plot(f_IIR(1:N_IIR)/fs,20*log10(abs(h_IIR(1:N_IIR))));
xlabel('Normalized Frequency (f/fs)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of IIR filter');

figure 
plot(time,origin);
hold on
plot(time,filtered_noise);
plot(time,filtered_noise_FIR_Hann);
plot(time,filtered_noise_FIR_Equirr);
xlabel('time(ms)');
ylabel('Signal')
legend('Original signal','Filtered noise using IIR','Filtered noise using FIR with hanning','Filtered noise using FIR with Equirrple');


figure
origin_freq=origin_fftshift/max(origin_fftshift);
noise_freq=noise_fftshift/max(noise_fftshift);
plot(f_shift,20*log10(noise_freq./origin_freq));
xlabel('frequency(Hz)');
ylabel('V_noise/V_origin');
title('Change between original signal and noise signal');