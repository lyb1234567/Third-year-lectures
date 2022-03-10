function T_D=T_D_non_EH(PiD,hiD,Pkc,hki,N0,N1)
A=PiD*hiD;
B=Pkc*hki+N0+N1;
T_D=log2(1+A/B);
end