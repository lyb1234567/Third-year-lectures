function [SiD,InfD,EhaD] = Prematch(D,C,Pkc,Pth1,Pmax,TminD)
% set the channel responses of D2D link and channel responses from D2D link
% and CUE link
syms hD h_interference_D2D_CUE
SiD=C;
%Non-EH D2D links
InfD=[];
%SWIPT-Eanbled communication system
EhaD=[];
for i=1:size(D,2)
    for k=1:size(C,2)
        %\lamda ie
        lambda_min=Pth1/(Pmax*hD(i)+Pkc* h_interference_D2D_CUE(k,i)+N0);
        Tid_max=log2(1+(Pmax*hD(i))/(Pkc*h_interference_D2D_CUE(k,i)+N0+(N1)/1-lambda_min));
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

