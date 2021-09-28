### DSBSC

- More effiecient
- Higher cost
- More complex



#### Coherent detection

It will be used to detect DSBSC.

![coherent dector](C:\Users\刘研博\Desktop\学习\Third-year-lectures\EEE317\3-s2.0-B9780128053454000093-f09-01-9780128053454.jpg)





### DSBLC

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

in-phase:**If two waves coincide with peaks and troughs matching they are** said to be in phase.

out-of-phase:A phrase used to characterize two or more signals whose phase relationship with each other is such that when **one is at its positive peak the other is at** (or near) its negative peak. 



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

- [ ] **Why?**



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
S_{o}(t)=si(t)\cos (w_{c}t)=Si_{t}cos^{2}(w_{c}t)
$$
Since the $2w_{c}$ term will be filtered off. Then the obtained signal will be
$$
S_{o}=\frac{1}{2}f(t)
$$

- [ ] **Why**?



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
\frac{S_{o}}{N_{o}}=\frac{\frac{1}{4}f(t)^2}{\frac{1}{4}n_{i}(t)^2}
$$

Hence $SNR_{o}=2SNR_{i}$

### Aim of this Course

FInd SNRi and SNRo which is SNR of input and SNR of output respectively





