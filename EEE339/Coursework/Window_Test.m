fs=359.9;
w_pass=(2*pi*70)/fs;
N=18;
w_stop=(8*pi/N)+w_pass;
alpha=round((N-1)/2);

omega=w_pass;

h=[];
for n=0:N-1
    if n-alpha==0
        h(end+1)=(1/pi)*omega*(cos(omega*0));
        continue;
    end
    A=sin(omega*(n-alpha));
    B=pi*(n-alpha);
    C=1-cos((2*pi*n)/(N-1));
    h(end+1)=(A/B)*(C/2);
    
end
array=0:N-1;
figure 
plot(array,h);
grid on
wvtool(h)
figure 

number=1:N;
[h_FIR,f_FIR]=freqz(h,1,'whole',1000,fs);
N_FIR=round(0.5*length(h_FIR));
plot(f_FIR(1:N_FIR),20*log10(abs(h_FIR(1:N_FIR))));
xlabel('Frequency (Hz)');ylabel('Magnitude (dB)');
grid on;title('Frequency response of FIR filter');
