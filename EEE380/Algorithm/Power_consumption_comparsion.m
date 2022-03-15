function Tik=Power_consumption_comparsion(Pkc,PiD,delta_E,hiD,hki)
eta=0.35;
eta_E=0.8;
N0=3.9810717055e-15;
 P_cir=0.1;
 
 Tik=(1/eta)*PiD+2*P_cir-delta_E*eta_E*(PiD*hiD+Pkc*hki+N0);
end