### Tutorial

1.The bigger the **threshold  voltage** compared as a ratio to the supply voltage, the slower the FET works



### Ltspice command line

.dc: It is used for DC analysis where you can set the voltage from x to y

![image-20211023150728796](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023150728796.png)

![image-20211023150804523](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023150804523.png)



.meas: measure a certain value of a certain node when input voltage(or any other voltage at a point) 

![image-20211023151336974](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023151336974.png)

![image-20211023151400272](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023151400272.png)



.param: As well as simulating a circuit with variable input voltage, its often useful to know how it will perform if one component or parameter is altered.

As shown in the figure below

![image-20211023152742504](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023152742504.png)

This type of command line will change the value of R2 in the step way then measure the power at different size





In the inverter, in order to make the transistors equivalent to each other,you have to make the p type transistors wider cause the mobility of hole is smaller than the mobility of electron.

### Noise margin

Let's look at an ideal inverter characteristic:

![image-20211023164056209](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023164056209.png)

Let's assume that  when $v_{in}< v_{m}\rightarrow vin$ is logic 0 $\rightarrow v_{o}$ is logic high. same for when $v_{in}>v_{m}$....

![image-20211023171112513](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023171112513.png)

![image-20211023171216217](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023171216217.png)

![image-20211023171302292](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211023171302292.png)



We want the noise margin in inverter as big as possible.

