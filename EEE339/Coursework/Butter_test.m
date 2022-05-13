load 'ECGData1(1).mat'
load 'Hann_Coefficient_FIR.mat'
origin=origSig';
noise=noisySig';

Ts=10/3599;
fs=1/Ts;
fd=60;
Wn=(fd)/(0.5*fs);
N=[15 16 17 18 19 20];
for i=1:6
     [b1 a1]= butter(N(i),Wn,'low');
     [h_IIR,f_IIR] = freqz(b1,a1,'whole',2001,fs);
     N_IIR=round(0.5*length(h_IIR));
     plot(f_IIR(1:N_IIR),20*log10(abs(h_IIR(1:N_IIR))));
     hold on
end
xlabel('Normalized Frequency (Hz)');ylabel('Magnitude (dB)');legend('N=15','N=16','N=17','N=18','N=19','N=20');
grid on; title('Frequency response of IIR filter');