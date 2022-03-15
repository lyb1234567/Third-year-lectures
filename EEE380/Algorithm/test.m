Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
USE_min=0.5;
Tmin=2;
[D2D,CUE]=system_model(20,20,10);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,10);
[QiD_optimal,PiD_optimal]=iterative_comparison(CUE,D2D,Pmax,Pkc,USE_min,hiD,hki);
