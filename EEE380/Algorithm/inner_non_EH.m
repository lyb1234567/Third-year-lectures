function [EE_final,PiD_final]=inner_non_EH(Pkc,D2D,CUE,InfD,unmatched_CUE,I,phi,hiD,hki,hiB,hkc)
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
        I=20;
        QiD=random(0,10);
        alpha=random(0,1);
        beta=random(0,1);
        while t<=I
           PiD_optimal=(((1+beta)*log2(exp(1)))/(alpha+QiD))-((Pkc*hki_sub{1,k}+N0+N1)/(hiD_sub));
           PiD=max([0 PiD_optimal]);
           T_D=T_D_non_EH(PiD,hiD_sub,Pkc,hki_sub{1,k},N0,N1);
           EC=Energy_Consumption(PiD,0);
           if T_D-QiD*EC>phi
              QiD=T_D/EC;
              alpha_=alpha+s*(PiD-Pmax);
              alpha=max([0 alpha_]);

              beta_=beta-s*(T_D-Tmin_D);
              beta=max([0 beta_]);
           else
                 PiD_sub=check_complex(PiD);
                 EE_sub=check_complex(QiD);
                 break;
           end
           t=t+1;
%            if t>I
%                PiD_sub=check_complex(PiD);
%                EE_sub=check_complex(QiD);
%                break;
%             end
        end
        PiD_array{1,k}=PiD_sub;
        EE_array{1,k}=EE_sub;
    end
    PiD_final{i,1}= PiD_array;
    EE_final{i,1}=EE_array;
end
end