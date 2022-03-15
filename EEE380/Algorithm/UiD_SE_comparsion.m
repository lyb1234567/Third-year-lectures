function output=UiD_SE_comparsion(delta_I,PiD,hiD,hki,Pkc)
N0=3.9810717055e-15;
N1=3.9810717055e-15;
A=delta_I*PiD*hiD;
B=delta_I*(Pkc*hki+N0)+N1;

output=log2(1+(A/B));
end