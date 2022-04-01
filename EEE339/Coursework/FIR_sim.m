time=linspace(0,1,100);
original=cos(2*pi*time);
noise=cos(2*pi*time)+rand(1,size(time,2));
range=time;
stem(range,noise);

b=rand(1,8);

y=[];

for n=1:size(noise,2)
    y_sub=0;
    for i=1:size(b,2)
        if n-i<0
            y_sub=y_sub+0;
            continue;
        end
        y_sub=y_sub+b(i)*noise(n+1-i);
    end
    y(end+1)=y_sub;
end

%Plot the original signal,noise,filtered signal
subplot(3,1,1);
plot(range,original);
title('original Signal');
xlabel('time')
ylabel('Amplitude');

subplot(3,1,2);
plot(range,noise);
title('noise Signal');
xlabel('time')
ylabel('Amplitude');


subplot(3,1,3);
plot(range,y);
title('Filtered Signal')
xlabel('time')
ylabel('Amplitude');


%plot the original and noise signal in the frequency domain
figure

%noise
noise_fft=fft(noise);
noise_fft_shift=fftshift(abs(noise_fft));

%original
origin_fft=fft(original);
origin_fft_shift=fftshift(abs(origin_fft));

fs=1/time(2);
L=size(original,2);
f_range= fs*(-L/2:(L-1)/2)/L;

subplot(2,1,1);
plot(f_range,noise_fft_shift/max(noise_fft_shift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Noise signal in the frequency domain');

subplot(2,1,2);
plot(f_range,origin_fft_shift/max(origin_fft_shift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
title('Original signal in the frequency domain');


