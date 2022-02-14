%Parameter from Parameter table
Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;

%Noise
N0=1*10^(-13);
N1=1*10^(-13);



% Using Pre-Matching 
[D2D,CUE]=system_model(20,20,20);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
Sid=clean_Sid(Sid);
number=[];
for i=1:size(Sid,1)
    number(end+1)=size(Sid{i,1},1);
end
bar(EhaD,number);
xlabel('D2D from EnaD');
ylabel('Number of partners for each D2D link ');
%clean the power gain of CUE k and D2D link i
hki=clean_hki(hki,Sid,CUE,EhaD);

% inner(D2D,CUE,EhaD,Sid,3,0.1,hiD,hki,hiB,hkc);