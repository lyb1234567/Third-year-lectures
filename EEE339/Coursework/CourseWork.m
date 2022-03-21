load 'ECGData1(1).mat'
origin=origSig';
noise=noisySig';

subplot(2,1,1);
time=linspace(0,2000,3600);
plot(time,origin);
xlabel('time(s)');
ylabel('original(v)')

subplot(2,1,2);
plot(time,noise);
xlabel('time(s)');
ylabel('original(v)');

