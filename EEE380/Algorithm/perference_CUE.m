function preference=perference_CUE(hiB,PiD,EhaD,CUE)
list={};
for k=1:size(CUE,1)
    temp=[];
    for i=1:size(EhaD,2)
        hiB_sub=hiB(i);
        PiD_sub=PiD{i,1}{1,k};
    end
end
end