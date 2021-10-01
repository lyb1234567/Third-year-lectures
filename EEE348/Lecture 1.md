# VLSI(Very Large Scale Integration)

### Trends

![image-20211001152711973](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211001152711973.png)

where  $\lambda$ is the half Pitch length. When scaling there are some components which will be changed:

- Area                    $\rightarrow \frac{1}{s^{2}}$
- Speed                  $\rightarrow \frac{1}{s^{2}}$
- Capacitance        $\rightarrow \frac{1}{s}$
- Resistance            $\rightarrow {s}$
- RC                          $\rightarrow {1}$

where C=$\frac{\varepsilon A}{t}$,where t is thickness and C is capacitance. Technically, the equation of Capacitance is
$$
C=&\frac{\varepsilon_{0}\varepsilon_{r}LW}{t}\\
E=&tV\\
Q=&CV
$$

So to increase charge, either increase the voltage or increase the capacitance.

### Intrinsic Limits

- What material of the oxide layer
- Gate it self which is made of poly-silicon doped polysilicon can cause problems
- Low k insulators(The problem is that there are fringing or parasitic capacitances that link every conducting element within the device together, which are deemed to be separate, due to the insulator)
- And the larger that capacitance, the bigger the problem I might encounter. And these problems can manifest themselves in various ways.
- Lithography(major problems)
- Doping of Si(There are limits of level we can dope, too small region)



Key: reduce the capacitor, then the situation can be improved



### Gate Oxide

While scaling down the dimensions, the oxide thickness can also be scaled.

- Scaling of dimensions is generally accompanied by scaling the oxide thickness(to keep field strengths within limits)
- Thinner oxides means increased tunnelling



Materials that have higher $\varepsilon_{r}$,they tend to have problems:

- increased tunnelling
- react with Si creating traps that reduce carrier mobility
- still uses SiO2 buffer layer- reduces effect



### Gate Electrode Material

- Currently uses highly-doped polysilicon
- If the gate oxide is changed then same problems occur as with underlying Si
- Problems can be countered by using metal electrodes but different metals are needed for n and p FETS - more complex processing



### Low k insulators

- As we scale devices down and all those structures get closer to each other and the coupling capacitance tends to increase, materials with lower relative permittivity are required



### Lithography

- Used to define the features of the devices
- Needs
  1.   wavelengths<feature size
  2. if the wavelength>=feature size then we encounter diffraction

