function [EE_final PiD_final]=inner_non_EH(Pkc,D2D,CUE,InfD,unmatched_CUE,I,phi,hiD,hki,hiB,hkc)
%parameter initialization
N0=1*10^(-13);
N1=1*10^(-13);
Pmax=0.1995262315;
Pth1=10*10^(-6);
Tmin_D=2;
Tmin_C=1;
s=1*10^(-5);
Pth=[10 100 230.06 57368]*10^(-6);

%output initialization
PiD_final={};
EE_final={};

for i=1:size(InfD,2)
    hiD_sub=hiD(InfD(i));
    hiB_sub=hiB(InfD(i));
    hki_sub=hki{i,1};
    PiD_array={};
    EE_array={};
    for k=1:size(unmatched_CUE,2)
        PiD_sub=[];
        EE_sub=[];
        t=1;
        I=5;
        PiD_initial=random(0,0.2);
        QiD=random(0,10);
        alpha=random(0,1);
        beta=random(0,1);
        while t<=I
            
        end
    end
end
end