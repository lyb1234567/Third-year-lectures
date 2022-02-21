
Pkc=0.1995262315;
 hkc=2.707*10^(-6);
 hki=3.7429*10^(-7);
 hiD=1.1527*10^(-4);
 hiB=4.9154*10^(-7);
 k=0.1427;
 b=108.2778*10^(-6);
 
 Pth=[10 100 230.06 57368]*10^(-6);
 Tmin_D=2;
Tmin_C=1;
 phi=0;
 s=1*10^(-5);
 PiD_initial=random(0,0.2);
EE_array=[];
QiD=10;
 P=[0.1 0.1995262315];
I=10;
number=1000;

for i=1:2
Pmax=P(i);
Q_sum=[];
Q=[];
alpha=random(0,1);
    beta=random(0,1);
    gamma=random(0,1);
    delta=random(0,1);
    in=random(0,1);
for f=1:number
    QiD=10;
    t=1;
    lambda=lambda_fix_PiD(PiD_initial,alpha,beta,gamma,delta,in,hiD,hki,k,QiD);
     I=10;
 while t<=I
     PiD=PiD_fix_lambda(lambda,alpha,beta,gamma,delta,in,hiD,hki,hkc,hiB,k,QiD);
     lambda=lambda_fix_PiD(PiD,alpha,beta,gamma,delta,in,hiD,hki,k,QiD);
     T_D=Throughput_D(lambda,PiD,hiD,hki);
     T_C=Throughput_C(hkc,hiB,PiD);
     PiR=received_power(lambda, PiD,hiD,hki);
     [EH,j]=EH_model(PiR);
     EC=Energy_Consumption(PiD,EH);
     Q(f,t)=QiD;
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
         PiD_new=PiD;
         lambda_new=lambda;
         EE=QiD;
         Q(f,t)=QiD;
         for n=t+1:I
             Q(f,n)=QiD;
         end
         break;
     end 
     t=t+1;
 end
 Q_sum=sum(Q)./number;
end
 EE_array(i,:)=Q_sum;
end
iteration=[];
for i=1:size(Q,2)
    iteration(end+1)=i;
end
plot(iteration,EE_array(1,:),iteration,EE_array(2,:));
xlabel('interation step')
ylabel('Energy Efficiency [bits/Hz/J]');
ylim([0 50]);
legend('Pmax=20dBm','Pmax=23dBm');

 