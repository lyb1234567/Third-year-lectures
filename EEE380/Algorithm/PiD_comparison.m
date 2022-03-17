function PiD_optimal=PiD_comparison(beta,gamma,QiD,delta_I,delta_E,hiD,hki,Pkc)
 N0=3.9810717055e-15;
 N1=3.9810717055e-15;
 eta_E=0.8;
 eta=0.35;
 A=eta*(1+gamma)*(1/log(2));
 B=QiD*(1-eta*delta_E*eta_E*hiD)+eta*beta;
 C=delta_I*(Pkc*hki+N0)+N1;
 D=delta_I*hiD;
 
 PiD_optimal=(A/B)-(C/D);
end