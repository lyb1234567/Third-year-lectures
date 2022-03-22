function sequence=sampling(signal,time,fs,number)
sequence_index=[];
sequence=[];
Ts=1/fs;
for i=1:number
    sequenc_index(end+1)=find(time==Ts);
    Ts=Ts+Ts;
end
sequence=signal(sequence_index);
end