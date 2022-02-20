
Pmax=0.2;
Pkc=0.1995262315;
 hkc=2.707*10^(-6);
 hki=3.7429*10^(-7);
 hiD=1.1527*10^(-4);
 hiB=4.9154*10^(-7);
 k=0.6967;
 b=-19.1737*10^(-6);
 
 Pth=[10 100 230.06 57368]*10^(-6);
 Tmin_D=2;
Tmin_C=1;
 phi=0;
 s=1*10^(-5);
 PiD_initial=random(0,0.2);
 Q_=[];
%  for i=1:2
%      Pmax=P(i);
sum_EE=[];
% for p=1:2
iteration=[];
EE_array=[];
temp=[];
% Pmax=P(p);
QiD=10;
 alpha=random(0,1);
 beta=random(0,1);
 gamma=random(0,1);
 delta=random(0,1);
 in=random(0,1);

 I=1;
 Q=[];
 t=1;
 lambda=lambda_fix_PiD(PiD_initial,alpha,beta,gamma,delta,in,hiD,hki,k,QiD);
 P=[0.1 0.1995262315];
 QiD=random(0,10);
I=1;
 while t<=I
     PiD=PiD_fix_lambda(lambda,alpha,beta,gamma,delta,in,hiD,hki,hkc,hiB,k,QiD);
     lambda=lambda_fix_PiD(PiD,alpha,beta,gamma,delta,in,hiD,hki,k,QiD);
     T_D=Throughput_D(lambda,PiD,hiD,hki);
     T_C=Throughput_C(hkc,hiB,PiD);
     PiR=received_power(lambda, PiD,hiD,hki);
     [EH,j]=EH_model(PiR);
     EC=Energy_Consumption(PiD,EH);
     Q(t)=QiD;
     T_D-QiD*EC
     if T_D-QiD*EC>=phi
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
         PiD_new=PiD;
         lambda_new=lambda;
         EE=QiD;
         Q(t)=QiD;
     end 
     t=t+1;
 end

% sum_EE(p,:)=sum(temp);
% end
% sum_EE=sum_EE./10;
% iteration=[];
% for i=1:I
%     iteration(end+1)=i;
% end
% plot(iteration,sum_EE(1,:),'--');
% hold on
% plot(iteration,sum_EE(2,:),'-');
% plot(iteration,EE_array,'-');
% title('Convergence of inner loop Algorithm');
% xlabel('interation step')
% ylabel('Energy Efficiency [bits/Hz/J]');
% legend('Pmax=20dBm','Pmax=23dBm');

 