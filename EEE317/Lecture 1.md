### Question

1. [why the mean value of the carrier and signal noise will be equal when in-phase and out-of-phase happens](#Q1)
2. [why the final output signal in DSBSC is $\frac{1}{2}f(t)$, shouldn't it be $\frac{1}{2}S_{i}(t)$?](#Q2)

### DSBSC(Double sideband supress carrier)

- More efficient
- Higher cost
- More complex



#### Coherent detection

It will be used to detect DSBSC.

![image-20210929112924014](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20210929112924014.png)





### DSBLC(Double sideband large carrier)

- less efficient
- lower cost





### Noise in AM systems

 Mean noise power in demodulator where a noise **voltage** is input into our demodulator
$$
N_{i}=\lim_{T\rightarrow\infin}\frac{1}{T}\int_{\frac{-T}{2}}^{\frac{T}{2}}\frac{n_{i}^{2}}{R}dt
$$
If the noise is in the form of  a **current**, then the mean noise will be
$$
Ni=\lim_{T\rightarrow\infin}\frac{1}{T}\int_{\frac{-T}{2}}^{\frac{T}{2}}n_{i}(t)^{2}R dt
$$


Ususally we will assume that  the noise power will flower into $R=1\ohm$. But it is noticable that in most cases R is matached to 50 $\ohm$.



#### random noise

$$
n_{i}(t)=n_{c}\cos(w_{c}t)-n_{s}(t)sin(w_{c}t)
$$

where the noise is defined in terms on **in-phase** and **out-of-phase**.

**in-phase**:**If two waves coincide with peaks and troughs matching they are** said to be in phase.

**out-of-phase** :A phrase used to characterize two or more signals whose phase relationship with each other is such that when **one is at its positive peak the other is at** (or near) its negative peak. 



So the final noise will be:
$$
N_{i}=\frac{1}{2T}\int_{\frac{-T}{2}}^{\frac{T}{2}}n_{c}(t)^{2}+n_{s}(t)^{2}[1-\cos(w_{c}t)]-2n_{c}(t)n_{s}(t)\sin(2w_{c}t)dt
$$
And it bascially used the trigonometry:
$$
\cos^2\alpha=\frac{1+cos2\alpha}{2}
$$
where the **R** is assumed to be **1$\ohm$**. 

the cos and sin terms average to zero to give,
$$
N_{i}=\frac{1}{2T}\int_{\frac{-T}{2}}^{\frac{T}{2}}n_{c}^{2}(t)+n_{s}^{2}(t)dt=\frac{1}{2}\hat{n_{c}(t)^{2}}+\frac{1}{2}n_{s}(t)^{2}
$$
Which is the additon of two mean value of power.

If the noise is random, then the  nosie spikes will occur in-phase and out-of phase with equal frequency and so we can see
$$
\hat{n_{c}(t)^{2}}=\hat{n_{s}(t)^{2}}=\hat{n_{i}(t)^{2}}
$$

### Q1

- [x] **Why?**  Cause when the noise is random, we assume that they are equal to each other although that I don't the exact reason......



### Signal

$$
S_{i}=\frac{1}{T}\int_{\frac{-T}{2}}^{\frac{T}{2}}s_{i}(t)^{2}dt
$$

### Amplitude demodulation

$$
S_{i}(t)=f(t)\cos(w_{c}t)
$$

Substitute it into the original equation:
$$
S_{i}=\frac{1}{T}\int_{\frac{-T}{2}}^{\frac{T}{2}}f^{2}(t)dt
$$
since the double angles was 0 during the integral.

So as shown before, accoding to DSBSC demodulation:
$$
S_{i}(t)=f(t)\cos(w_{c}t)\\
S_{o}(t)=S_{i}(t)\cos (w_{c}t)=f(t)cos^{2}(w_{c}t)
$$
Since the $2w_{c}$ term will be filtered off. Then the obtained signal will be
$$
S_{o}=\frac{1}{2}f(t)
$$

### Q2

- [x] **Why**? Ttpo......



So the average power of the ouput signal will be
$$
Sop=\frac{1}{T}\int_{\frac{-T}{2}}^{\frac{T}{2}}(\frac{1}{2}f(t))^{2}=\frac{1}{4}\hat{f(t)^2}
$$


**No matter what is at input both noise and signal will be demodulated accodingly:**

so the output noise will be $n_{o}(t)=ni(t)cos(w_{c}t)$ which is the same as the input signal and output signal which is:
$$
n_{o}(t)=\frac{1}{2}n_{c}(t)[1+cos(2w_{c}t)]-\frac{1}{2}n_{s}(t)sin(2w_{c}t)
$$
Again, after filtered off  $n_{o}(t)=\frac{1}{2}n_{c}(t)$, so the corresponding average power will be:
$$
N_{o}=\frac{1}{T}\int_{\frac{-T}{2}}^{\frac{T}{2}}(\frac{1}{2}n_{c}(t))^{2}dt=\frac{1}{4}\hat{n_{i}^{2}(t)}
$$


### Final SNR Ratio

$$
\frac{S_{i}}{N_{i}}=\frac{\frac{1}{2}\hat{f(t)^{2}}}{\hat{n_{i}(t)^{2}}}\\
\frac{S_{o}}{N_{o}}=\frac{\frac{1}{4}\hat{f(t)^2}}{\frac{1}{4}\hat{n_{i}(t)^2}}
$$

Hence $SNR_{o}=2SNR_{i}$



### Find noise performance of DSBLC through envelope detector

$$
S_{i}=(\alpha+f(t))\cos(w_{c}t)=Re\{(\alpha+f(t))e^{jw_{c}t}\}
$$

where $\alpha$ is the carrier amplitude

So the input noise will be given as:
$$
n_{i}(t)=n_{c}(t)cos(w_{c}t)-n_{s}\sin(w_{c}t)
$$
So the input to  envelope detector would be the addition of signal and noise:
$$
s_{i}(t)+n_{i}(t)=Re\{(\alpha+f(t)+n_{c}(t)+jn_{s}(t))e^{jw_{c}t}\}
$$
So the modulus of the input waveform can be expressed as:
$$
r(t)=\sqrt{(\alpha+f(t)+n_{c})^{2}+n_{s}(t)^{2}}\\
r(t)=(\alpha+f(t)+n_{c}(t))\sqrt{1+\frac{n_{s}(t)^2}{\alpha+f(t)+n_{c}(t)^{2}}}
$$
Since $n_{s}(t)<<\alpha$ and$n_{s}<<f_{s}(t)$ . So $r(t)\approx(\alpha+f(t)+n_{c}(t))$. which is addition of DC term,signal term and  noise term.

And r(t) is the output of the envelope detector

- [x] Why?

As for envelope detector:

  ![envelope_detector](C:\Users\admin\Desktop\学习\Third-year-lectures\EEE317\envelope_detector.png)



So usually the envelope of  the signal:
$$
x(t)=(C+m(t))cos(wt)
$$
where C is the carrier amplitude and m(t) is the message signal.  And the output is the envelope. That's the reason why the r(t) is the output of the envelope detector.



Since the DC term can be filtered out, so the remaining will be signal term and noise term.

which means that the output signal $S_{o}=f(t),N_{o}=n_{c}(t)$.

which means that their corresponding mean output signal and noise power can be given as:
$$
S_{o}=\hat{f(t)^{2}} \\
N_{o}=\hat{n_{c}(t)^{2}}
$$
Similarly, since $S_{i}=\hat{a+f(t)^{2}cos(w_{c}t)^{2})}$ where the $2w_{c}t$ term will be filtered out. So the final input signal will be $\frac{1}{2}(\alpha+\hat{f(t)^{2}})$

where the input noise is $\hat{n_{i}(t)}$ which is the similar as that in DSCSC.

so
$$
 \frac{S_{i}}{N_{i}}=2\frac{S_{i}}{N_{i}}-\frac{\alpha^{2}}{\hat{n_{i}^{2}}}
$$
which means that $SNR_{O}<2SNR_{i}$

where in DSBSC $SNR_{O}=2SNR_{i}$ ,that's the reason why DSBLC is  less efficient that DSBSC.





### Signal power in FM systems



Limiter: To stop fluctuation, and set the certain value we want.

The FM signal can be represented by:
$$
s_{i}(t)=\alpha\cos(w_{c}t+c\int_{0}^{t}{f(\tau)}d\tau)
$$
where $\alpha$ is the signal amplitude and c is a constant.

And the instantaneous frequency can be written as the derivative of the phase:
$$
f_{i}=\frac{d}{dt}(w_{c}t+c\int_{0}^{t}{f(\tau)}d\tau)=w_{c}+cf(t)
$$
 Let's assume a FM receiver looks like this:

![FM_receiver](\\studata10\home\EL\Elc20yl\ManW10\Desktop\ECE\Third-year-lectures\EEE317\FM_receiver.png)

 The signal after the demodulation is proportional  to the difference between **instantaneous frequency and carrier frequency.**

Just a quick recall for FM demodulation

![image-20210929100502445](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20210929100502445.png)

Let's say the $y_{fM}$ is
$$
y_{fm}(t)=Ec \cos(w_{c}t+c\int{m(t)dt})
$$
After the differentiator, the signal will be
$$
-E{c}(w_{c}+cm(t))sin(w_{c}t+c\int{m(t)dt})
$$
Then what we need to do just simply use the envelope detector to extract the amplitude
$$
wc+c(t)
$$


Then the output will be proportional to $w_{c}+c(t)-w_{c}$, where $w_{c}+c(t)$ is the **instantaneous frequency**

So that's the reason why the final output is $s_{o}(t)=Kcf(t)$ where $K$ depends on the receiver.



### Noise in FM

When considering the noise, we can just simply add them up to an unmodulated carrier frequency:
$$
=\alpha \cos(w_{t})+n_{c}(t)cos(w_{t}t)-n_{s}sin(w_{c}t)\\
=r(t)cos(w_{c}t+\gamma(t))
$$
![image-20210929104249344](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20210929104249344.png)

In this phasor diagram, either $n_{c}t$ or$\alpha$ has been multiplied by $w_{c}t$,  while $-sin\alpha=cos(\alpha-90^{o})$, so that's the reason why $n_{s}(t)$ is clockwise $90^{o}$ between  the cos term.



And from the diagram,we can see that:
$$
\alpha+n_{c}t=r(t)cos(\gamma(t))\\
n_{s}(t)=r(t)sin(\gamma(t))
$$
And substitute them into the original signal we can get the expression of r(t)



According to FM, we need to know the instantaneous frequency:
$$
\gamma(t)=tan^{-1}(\frac{n_{s}(t)}{\alpha+n_{s}(t)})\approx tan^{-1}(\frac{n_{s}}{\alpha})\approx\frac{n_{s}(t)}{\alpha}(limit)
$$
where we just assume that $n_{s}(t)<<\alpha$, $n_{s}(t)<<\alpha$(**quite important!!!**)



And accordingly, the final output nosie:
$$
n_{o}(t)=\frac{K}{\alpha}\frac{d}{dt}n_{s}(t)
$$
The output noise power could be caculated by using Parseval's theorem:
$$
\frac{1}{\pi}\int_{-\infty}^{\infty}|x(t)|^{2}dt=\frac{1}{2\pi}\int_{-\infty}^{\infty}|X(w)|^{2}dw\\
N_{o}=\frac{1}{2\pi}\int_{-\infty}^{\infty}S_{no}(w)dw
$$

$$
S_{no}(w)=\frac{K^{2}w^{2}}{\alpha^{2}}\eta
$$

where $\eta$ it the white noise which has the same magnitude of  output frequency





Hence the noise output from the demodulator will increase with the square of the frequency deviation.

#### Risk

When increasing the frequency, the **output signal** will become **very weak.**



#### Solution

**Pre-emphasis filter** and  **De-emphasis filter** to set a certain frequency limit before the noise is introduced

### Aim of this Course

FInd SNRi and SNRo which is SNR of input and SNR of output respectively





