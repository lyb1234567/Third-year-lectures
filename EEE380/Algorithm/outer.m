function [lambda_clean,PiD_clean,EE_clean]=outer(lambda,PiD,EE,hiD,hki,EhaD,Sid)

%parameter initialization
b=[0 -1.6613 -19.1737 108.2778]*10^(-6);
k=[ 0 0.3899 0.6967 0.1427];
N0=1*10^(-13);
N1=1*10^(-13);
Pmax=0.1995262315;
Pkc=0.1995262315;
Pth1=10*10^(-6);
Tmin_D=2;
Tmin_C=1;
s=1*10^(-5);
Pth=[10 100 230.06 57368]*10^(-6);

for i=1:size(EhaD,2)
    EE_sub=EE{i,1};
    lambda_sub=lambda{i,1};
    PiD_sub=PiD{i,1};
    hiD_sub=hiD(EhaD(i));
    hki_sub=hki{i,1};
    partner=Sid{i,1};
    for k=1:size(partner,1)
        PiR_max=Pmax*hiD_sub+Pkc*hki_sub{1,k}+N0;
        EE_array=EE_sub{1,k};
        [EH,Nmax]=EH_model(PiR_max);
         for j=1:Nmax
             [argvalue, argmax] = max(EE_array(1:j));
         end
         j_optimal=argmax;
         EE_array_optimal=argvalue;
         EE{i,1}{1,k}=EE_array_optimal;
         PiD{i,1}{1,k}=PiD_sub{1,k}(j_optimal);
         lambda{i,1}{1,k}=lambda_sub{1,k}(j_optimal);
    end
    
end
lambda_clean=lambda;
PiD_clean=PiD;
EE_clean=EE;
end