[b,a] = butter(3,0.5,'high');
[h,w] = freqz(b,a);

dB = mag2db(abs(h));

plot(w,dB)
xlabel('\omega / \pi')
ylabel('Magnitude (dB)')
ylim([-82 5])