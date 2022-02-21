hiD=2.322*10^(-4);
hki=[1.4748*10^(-8) 2.7587*10^(-5) 1.5613*10^(-7) 4.1044*10^(-7)];
hkc=[1.9681*10^(-7) 5.6252*10^(-6) 6.7788*10^(-7) 2.0783*10^(-6)];
hiB=0.0177*10^(-7);
b=[0 -1.6613 -19.1737 108.2778]*10^(-6);
k=[ 0 0.3899 0.6967 0.1427];
N0=1*10^(-13);
Pmax=0.1995262315;
Pkc=0.1995262315;
Pth1=10*10^(-6);
Tmin_D=2;
Tmin_C=1;
phi=0;
s=1*10^(-6);
Pth=[10 100 230.06 57368]*10^(-6);

PiD_array={};
lambda_array={};
EE_array={};

for q=1:size(hki,2)
    PiR_max=Pmax*hiD+Pkc*hki(q)+N0;
    [EH,Nmax]=EH_model(PiR_max);
    PiD_sub=[];
    lambda_sub=[];
    EE_sub=[];
    for j=1:Nmax
        PiD_initial=random(0,0.2);
        QiD=random(0,10);
        alpha=random(0,1);
        beta=random(0,1);
        gamma=random(0,1);
        delta=random(0,1);
        in=random(0,1);
        t=1;
        I=10;
        lambda=lambda_fix_PiD(PiD_initial,alpha,beta,gamma,delta,in,hiD,hki(q),k(j),QiD);
        while t<=I
            PiD=PiD_fix_lambda(lambda,alpha,beta,gamma,delta,in,hiD,hki(q),hkc(q),hiB,k(j),QiD);
            lambda=lambda_fix_PiD(PiD,alpha,beta,gamma,delta,in,hiD,hki(q),k(j),QiD);
            T_D=Throughput_D(lambda,PiD,hiD,hki(q));
            T_C=Throughput_C(hkc(q),hiB,PiD);
            PiR=received_power(lambda, PiD,hiD,hki(q));
            [EH,n]=EH_model(PiR);
            EC=Energy_Consumption(PiD,EH);
            T_D-QiD*EC
            if T_D-QiD*EC>phi
              QiD=T_D/EC;
              alpha_=alpha+s*(PiD-Pmax);
              alpha=max([0 alpha_]);

              beta_=beta+s*(lambda-1);
              beta=max([0 beta_]);

              gamma_=gamma-s*(T_D-Tmin_D);
              gamma=max([0 gamma_]);

              delta_=delta-s*(T_C-Tmin_C);
              delta=max([0 delta_]);

              in_=in-s*(PiR-Pth(1));
              in=max([0 in_]);
              continue;
            else
                 PiD_sub(j)=PiD;
                 lambda_sub(j)=lambda;
                 EE_sub(j)=QiD;
            end
            t=t+1;
        end
    end
    PiD_array{q,1}=PiD_sub;
    lambda_array{q,1}=lambda_sub;
    EE_array{q,1}=EE_sub;
end