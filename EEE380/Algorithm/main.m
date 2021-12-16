%Parameter from Parameter table
Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;
%Generate the system model
[D2D,CUE]=system_model(30,30,20);
%Prematching
[Sid,InfD,EhaD]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
%Remove the CUE whose coordinate is (0,0), which means that it will not be
%paired with corresponding D2D link i
for i=1:size(Sid,1)
    temp=Sid{i,1};
    index=[];
    for k=1:size(temp,1)
        if temp(k,1)==0 && temp(k,2)==0
            index(end+1)=k;
        end
    end
    temp(index,:)=[];
    Sid{i,1}=temp;
end


