function sequence=sampling(signal,time,fs,number)
sequence_index=[];
sequence=[];
a=1/fs;
Ts=0;
for i=1:number
    sequence_index(end+1)=find(time==Ts);
    Ts=i*a;
end
sequence=signal(sequence_index);
end