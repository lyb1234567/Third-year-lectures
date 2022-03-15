function [QiD_optimal,PiD_optimal]=iterative_comparison(CUE,D2D,Pmax,Pkc,USE_min,hiD,hki)

N0=1*10^(-13);
N1=1*10^(-13);
eta=0.35;
I=10;
phi=0;
QiD_optimal=[];
PiD_optimal=[];
s=1*10^(-5);
for i=1:size(D2D,1)
    hiD_sub=hiD(i);
    for k=1:size(CUE,1)
        hki_sub=hki(i,k);
        QiD=random(0,10);
        PiD=random(0,Pmax);
        t=1;
        delta_I=random(0.2,0.8);
        delta_E=1-delta_I;
        beta=random(0,1);
        gamma=random(0,1);
        while t<=I
            UiD_SE=UiD_SE_comparsion(delta_I,PiD,hiD_sub,hki_sub,Pkc);
            Tik=Power_consumption_comparsion(Pkc,PiD,delta_E,hiD_sub,hki_sub);
            if UiD_SE-Tik*QiD>phi
                QiD=UiD_SE/Tik;
                beta_=beta+s*(PiD-Pmax);
                beta=max([0 beta_]);
                
                gamma_=gamma-s*(UiD_SE-USE_min);
                gamma=[0 gamma_];
            else
                QiD_optimal(i,k)=QiD;
                PiD_optimal(i,k)=PiD;
                break;
            end
            t=t+1;
            PiD=PiD_comparison(beta,gamma,QiD,delta_I,delta_E,hiD_sub,hki_sub,Pkc);
            if t>I
                 PiD_optimal(i,k)=PiD;
                 QiD_optimal(i,k)=QiD;
                 break;
            end
        end
    end
end
end