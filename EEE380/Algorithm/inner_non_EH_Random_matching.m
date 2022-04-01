function EE_final=inner_non_EH_Random_matching(Pkc,D2D,CUE,InfD,unmatched_CUE,I,phi,hiD,hki,hiB,hkc)
%parameter initialization
N0=1*10^(-13);
N1=1*10^(-13);
Pmax=0.1995262315;
Pth1=10*10^(-6);
Tmin_D=2;
Tmin_C=1;
s=1*10^(-5);
Pth=[10 100 230.06 57368]*10^(-6);
Pir=0.1;
%output initialization
EE_final={};

PiD=Pmax;
for i=1:size(InfD,2)
    hiD_sub=hiD(InfD(i));
    hiB_sub=hiB(InfD(i));
    EE_sub=[];
    hki_sub=hki{i,1};
    for k=1:size(unmatched_CUE,2)
       A=PiD*hiD_sub;
       B=Pkc*hki_sub{k}+N1+N0;
       TiD_non_EH=log2(1+(A/B));
       EC_non_EH=PiD+2*Pir;
       EE_sub(1,k)=TiD_non_EH/EC_non_EH;
    end
    EE_final{i,1}=EE_sub;
end