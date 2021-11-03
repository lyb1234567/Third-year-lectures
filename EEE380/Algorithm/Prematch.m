function [SiD,InfD,EhaD] = Prematch(D,C,Pkc,Pth1,Pmax,TminD)
SiD=C;
%Non-EH D2D links
InfD=[];
%SWIPT-Eanbled communication system
EhaD=[];
for i=D
    for k=C
        %\lamda ie
        lambda_min=Pth1/(Pmax*hid+Pkc*hki+N0);
        Tid_max=log2(1+(Pmax*hid)/(Pkc*hki+N0+(N1)/1-lambda_min));
        %compare the minimum power splitting ratio and maximum
        %Throughput,if both of the requiremnts can not be met, then the k
        %will be removed from the selection set.
        if lambda_min>1 || Tid_max<TminD
            SiD(SiD==k)=[];
        end 
    end
    %After the CUE set was scanned, then check if the selection set is
    %empty
    if isempty(SiD)==1
        InfD(end+1)=i;
    end
    
    if isempty(SiD)~=1
        EhaD(end+1)=i;
    end
end
            
        
end

