%Parameter from Parameter table
Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;

%Noise
N0=1*10^(-13);
N1=1*10^(-13);

%Prematching_test
% test_prematching_distance();
% test_premtaching_number();
% test_prematching_Pth1_distance();
% test_prematching_Pth1_number();


%EH model test
% PiR=130*10^(-6);
% [EH,j]=EH_model(PiR);

% TELLA
[D2D,CUE]=system_model(20,20,20);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
Sid=clean_Sid(Sid);
hki=clean_hki(hki,Sid,CUE);
inner(D2D,CUE,EhaD,Sid,3,0.1,hiD,hki,hiB,hkc);