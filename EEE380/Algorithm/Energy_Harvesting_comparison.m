function Energy=Energy_Harvesting_comparison(PiD,hki,hkc,Pkc,delta_E)
 N0=3.9810717055e-15;
 N1=3.9810717055e-15;
 eta_E=0.8;
 Energy=eta_E*delta_E*(Pkc*hkc+PiD*hki+N0);
 if isnan(Energy) || isinf(Energy)
     Energy=0;
 end
end