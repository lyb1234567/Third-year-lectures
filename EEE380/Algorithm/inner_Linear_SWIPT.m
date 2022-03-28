function [lambda_final,PiD_final,EE_final]=inner_Linear_SWIPT(Pkc,D2D,CUE,EhaD,Sid,I,phi,hiD,hki,hiB,hkc)
k=0.1427;
b= 108*10^(-6);
Pmax=0.1995262315;
Tmin_D=2;
Tmin_C=1;
s=1*10^(-5);
Pth=[10 100 230.06 57368]*10^(-6);

PiD_final={};
lambda_final={};
EE_final={};

for i=1:size(EhaD,2)
    hiD_sub=hiD(EhaD(i));
    hiB_sub=hiB(EhaD(i));
    partner=Sid{i,1};
    hki_sub=hki{i,1};
    PiD_array={};
    lambda_array={};
    EE_array={};
    for q=1:size(partner,1)
        PiD_sub=[];
        lambda_sub=[];
        EE_sub=[];
        location=location_CUE(CUE,partner(q,:));
        PiD_initial=random(0,0.2);
        QiD=random(0,10);
        alpha=random(0,1);
        beta=random(0,1);
        gamma=random(0,1);
        delta=random(0,1);
        in=random(0,1);
        t=1;
        lambda=lambda_fix_PiD(PiD_initial,alpha,beta,gamma,delta,in,hiD_sub,hki_sub{1,q},k,QiD);
        while t<=I
            PiD=PiD_fix_lambda(lambda,alpha,beta,gamma,delta,in,hiD_sub,hki_sub{1,q},hkc(location),hiB_sub,k,QiD);
            lambda=lambda_fix_PiD(PiD,alpha,beta,gamma,delta,in,hiD_sub,hki_sub{1,q},k,QiD);
            T_D=Throughput_D(lambda,PiD,hiD_sub,hki_sub{1,q});
            T_C=Throughput_C(hkc(location),hiB_sub,PiD);
            PiR=received_power(lambda, PiD,hiD_sub,hki_sub{1,q});
            EH=PiR*k+b;
            EC=Energy_Consumption(PiD,EH);
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
            else
                PiD_sub(end+1)=check_complex(PiD);
                 lambda_sub(end+1)=check_complex(lambda);
                 EE_sub(end+1)=check_complex(QiD);
               break;
            end
            t=t+1;
            if t>I
                 PiD_sub(end+1)=check_complex(PiD);
                 lambda_sub(end+1)=check_complex(lambda);
                 EE_sub(end+1)=check_complex(QiD);
               break;
            end
        end
         PiD_array{1,q}=PiD_sub;
         lambda_array{1,q}=lambda_sub;
         EE_array{1,q}=EE_sub;
    end
    PiD_final{i,1}= PiD_array;
    lambda_final{i,1}=lambda_array;
    EE_final{i,1}=EE_array;
end
end