function show_proposal(CUE,proposal)
temp={};
for k=1:size(CUE,1)
    temp{1,k}=proposal(k);
end
temp
end