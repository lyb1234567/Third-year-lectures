function [PiD ,QiD]=test_PiD_fix_lambda()
lambda=random(0,1);
 alpha=0.0000001;
 beta=0.0000001;
 gamma=0.0000001;
 delta=0.0000001;
 in=0.0000001;
 hkc=2.707*10^(-6);
 hki=3.7429*10^(-7);
 hiD=1.1527*10^(-4);
 hiB=4.9154*10^(-7);
 k=0.6967;
 b=-19.1737*10^(-6);
 QiD=random(10,40);
 PiD=PiD_fix_lambda(lambda,alpha,beta,gamma,delta,in,hiD,hki,hkc,hiB,k,QiD);
end