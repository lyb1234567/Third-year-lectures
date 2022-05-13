load 'ECGData1(1).mat'
load 'Hann_Coefficient_FIR.mat'
origin=origSig';
noise=noisySig';

Ts=10/3599;
fs=1/Ts;
time=0:Ts:10;
plot(time,origin);
xlabel('time(ms)');
ylabel('Amplitude(mv)');
title('Original signal');
figure
L=size(origin,2);
f_shift=(-L/2:L/2-1)*(fs/L);
plot(time,origin);
xlabel('Time(ms)');
ylabel('Amplitude(mV)');
title('Origin');
hold on
filtered_origin_FIR_Hann=filter(Hann_Coefficient,1,origin);
plot(time,filtered_origin_FIR_Hann);
xlabel('Time(ms)');
ylabel('Amplitude(mV)');
title('Filtered Signal');
figure
origin_fft=fft(origin);
origin_fftshift=fftshift(abs(origin_fft));
plot(f_shift,origin_fftshift/max(origin_fftshift));
xlabel('Frequency(Hz)');
ylabel('Amplitude(mV)');
title('Origin in the frequency domain');

figure
origin_filter_fft=fft(filtered_origin_FIR_Hann);
origin_filter_fftshift=fftshift(abs(origin_filter_fft));
plot(f_shift,origin_filter_fftshift/max(origin_filter_fftshift));
xlabel('Frequency(Hz)');
ylabel('Amplitude(mV)');
title('Filtered Signal in the frequency domain');

figure 
N=[4 8 15];
fd=60;
Wn=(fd)/(0.5*fs);
for i=1:3
[b1 a1]= butter(N(i),Wn,'low');
filtered_noise = filter(b1,a1,origin); 
plot(time,filtered_noise);
hold on
end
plot(time,origin);
xlabel('time(ms)');
ylabel('filtered noise(mv)');
title('Filtered noise using IIR fc=60Hz');
legend('N=4','N=8','N=15','Original');

figure
for n=1:3
[b1 a1]= butter(N(n),Wn,'low');
[h_IIR,f_IIR] = freqz(b1,a1,'whole',2001,fs);
N_IIR=round(0.5*length(h_IIR));
plot(f_IIR(1:N_IIR),20*log10(abs(h_IIR(1:N_IIR))));
hold on
end
xlabel('Frequency (Hz)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of IIR filter fc=60Hz');
legend('N=4','N=8','N=15');


figure
N=4;
fd=[20 30 50];
Wn=fd./(0.5*fs);
for i=1:3
    [b1 a1]= butter(N,Wn(i),'low');
    filtered_noise = filter(b1,a1,origin); 
    plot(time,filtered_noise);
    hold on
end
plot(time,origin);
xlabel('time(ms)');
ylabel('filtered noise(mv)');
xlim([3.52 3.7])
title('Filtered noise using IIR N=4');
legend('fc=20Hz','fc=30Hz','fc=40Hz','Original');

figure
for n=1:3
[b1 a1]= butter(4,Wn(n),'low');
[h_IIR,f_IIR] = freqz(b1,a1,'whole',2001,fs);
N_IIR=round(0.5*length(h_IIR));
plot(f_IIR(1:N_IIR),20*log10(abs(h_IIR(1:N_IIR))));
hold on
end
xlabel('Frequency (Hz)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of IIR filter N=4');
legend('fc=20Hz','fc=30Hz','fc=40Hz');

figure 
N=4;
fd=30;
Wn=fd./(0.5*fs);
[b1 a1]= butter(N,Wn,'low');
filtered_noise = filter(b1,a1,origin); 
subplot(2,1,1);
plot(time,filtered_noise);
xlabel('Time(ms)');
ylabel('Amplitude(mV)');
xlim([1.0 4]);
title('IIR Cut-off:30 Hz N=4');

subplot(2,1,2);
plot(time,origin);
xlabel('Time(ms)');
ylabel('Amplitude(mV)');
xlim([1.0 4]);
title('Original');


