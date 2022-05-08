load 'ECGData1(1).mat'
original=origSig';
noise=noisySig';
Ts=10/3599;
fs=1/Ts;
time=0:Ts:10;
L=size(original,2);
f_range= fs*(0:L-1)/L;
f_shift=(-L/2:L/2-1)*(fs/L);
noise_fft=fft(noise);
noise_fftshift=fftshift(abs(noise_fft));

figure
plot(f_shift,noise_fftshift/max(noise_fftshift));
xlabel('frequency (Hz)');
ylabel('Amplitude (mV)');
stopband=117.667;
title(['    Noise:' num2str(f_shift(2978)) 'Hz' '   Cutoff: ' num2str(f_shift(2401)) 'Hz']);
hold on
C=noise_fftshift/max(noise_fftshift);
plot(f_shift(2978),C(2978),'^','Color','r','MarkerFaceColor','r');
plot(f_shift(2401),C(2401),'^','Color','b','MarkerFaceColor','b');
legend('Noise','Unwanted Signal','Wanted Signal');

