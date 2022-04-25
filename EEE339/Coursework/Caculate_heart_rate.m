load 'ECGData1(1).mat'
original=origSig';
noise=noisySig';
Ts=10/3599;
fs=1/Ts;
time=0:Ts:10;
plot(time,original);
xlabel('time(ms)');
ylabel('original(mv)');
ismax = islocalmax(original,'MinProminence',200);
count=nnz(ismax);
N=length(original);
duration_in_seconds=N/fs;
duration_in_minutes=duration_in_seconds/60;
Bpm=count/duration_in_minutes;
hold on
plot(time(find(ismax)),original(ismax),'^','Color',[217 83 25]/255,...
    'MarkerFaceColor',[217 83 25]/255,'DisplayName','Local maxima');
xlabel('time(ms)');
ylabel('Volts(mv)');
grid on
title(['Number of extrema:' num2str(nnz(ismax)) '       Bpm:' num2str(Bpm)]);
legend('Original signal','Local maxima');


