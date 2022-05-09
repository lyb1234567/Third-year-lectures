load 'Hann_15.mat'
load 'Hann_16.mat'
load 'Hann_17.mat'
load 'Hann_18.mat'
load 'Hann_19.mat'
load 'Hann_20.mat'

fs=359.9;

[h_FIR_15,f_FIR_15]=freqz(Hann_15,1,'whole',2001,fs);
[h_FIR_16,f_FIR_16]=freqz(Hann_16,1,'whole',2001,fs);
[h_FIR_17,f_FIR_17]=freqz(Hann_17,1,'whole',2001,fs);
[h_FIR_18,f_FIR_18]=freqz(Hann_18,1,'whole',2001,fs);
[h_FIR_19,f_FIR_19]=freqz(Hann_19,1,'whole',2001,fs);
[h_FIR_20,f_FIR_20]=freqz(Hann_20,1,'whole',2001,fs);
N_FIR=round(0.5*length(h_FIR_15));

plot(f_FIR_15(1:N_FIR),20*log10(abs(h_FIR_15(1:N_FIR))));
hold on
plot(f_FIR_16(1:N_FIR),20*log10(abs(h_FIR_16(1:N_FIR))));
hold on
plot(f_FIR_17(1:N_FIR),20*log10(abs(h_FIR_17(1:N_FIR))));
hold on
plot(f_FIR_18(1:N_FIR),20*log10(abs(h_FIR_18(1:N_FIR))));
hold on
plot(f_FIR_19(1:N_FIR),20*log10(abs(h_FIR_19(1:N_FIR))));
hold on
plot(f_FIR_20(1:N_FIR),20*log10(abs(h_FIR_20(1:N_FIR))));

xlabel('Frequency(Hz)');
ylabel('Atteunation(dB)');
title('Frequency response of FIR filters with different order');
K_c_15=20*log10(abs(h_FIR_15(335)));
K_c_16=20*log10(abs(h_FIR_16(335)));
K_c_17=20*log10(abs(h_FIR_17(335)));
K_c_18=20*log10(abs(h_FIR_18(335)));
K_c_19=20*log10(abs(h_FIR_19(335)));
K_c_20=20*log10(abs(h_FIR_20(335)));

K_stop_15=20*log10(abs(h_FIR_15(652)));
K_stop_16=20*log10(abs(h_FIR_16(652)));
K_stop_17=20*log10(abs(h_FIR_17(652)));
K_stop_18=20*log10(abs(h_FIR_18(652)));
K_stop_19=20*log10(abs(h_FIR_19(652)));
K_stop_20=20*log10(abs(h_FIR_20(652)));

A=['N=15  Kpass=',num2str(K_c_15),'dB',' K_stop=',num2str(K_stop_15),'dB'];
B=['N=16  Kpass=',num2str(K_c_16),'dB',' K_stop=',num2str(K_stop_16),'dB'];
C=['N=17  Kpass=',num2str(K_c_17),'dB',' K_stop=',num2str(K_stop_17),'dB'];
D=['N=18  Kpass=',num2str(K_c_18),'dB',' K_stop=',num2str(K_stop_18),'dB'];
E=['N=19  Kpass=',num2str(K_c_19),'dB',' K_stop=',num2str(K_stop_19),'dB'];
F=['N=20  Kpass=',num2str(K_c_20),'dB',' K_stop=',num2str(K_stop_20),'dB'];
legend(A,B,C,D,E,F);

