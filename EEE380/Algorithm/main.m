% test_sum_EE_number_D2D_CUE();
% test_sum_EE_distance();
% test_sum_EE_CUE_transmission_power();
Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;
[D2D,CUE]=system_model(20,20,20);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
plot_model(D2D,CUE);