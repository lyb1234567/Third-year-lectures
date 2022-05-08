N=20;
fs=359.9;
a=hann(N);
b=hamming(N);
c=rectwin(N);

[h_a,f_FIR_a]=freqz(a,1,'whole',2001,fs);
[h_b,f_FIR_b]=freqz(b,1,'whole',2001,fs);
[h_c,f_FIR_c]=freqz(c,1,'whole',2001,fs);
N_FIR=round(0.5*length(h_a));
plot(f_FIR_a(1:N_FIR),20*log10(abs(h_a(1:N_FIR))));
hold on
plot(f_FIR_b(1:N_FIR),20*log10(abs(h_b(1:N_FIR))));
hold on
plot(f_FIR_c(1:N_FIR),20*log10(abs(h_c(1:N_FIR))));
xlabel('Frequency (Hz)');ylabel('Magnitude (dB)');
legend('Hanning','Hamming','Rectangular');
grid on;title(['N=', num2str(N)]);
clear 