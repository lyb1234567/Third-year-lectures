### Glossary

- [Radio propagation](#Radio_propagation) 
- [Large-scale fading](#Large_Scale)
- [LOS](#LOS)
- [NLOS](NLOS)

#### Traditional methods of  obtaining **Radio propagation**: 

Via Deterministic and Stochastic Channel Models and applying a regular statistical method to build a model.



##### Challenges:

While employing new technologies/frequency-bands and the increase of data traffic, these traditional methods become more complex and time consuming.

The general mathematical mode can be shown as:
$$
y(t)=x(t)*h(\tau,t)=\int_{-\infin}^{\infin}h(\tau,t)x(t-\tau)d\tau
$$
Where $y(t)$ is the received signal, $x(t)$ is the transmitted signal, and h(τ, t) is the delay spread function with respect to delay and time.



The general **Close-in (CI) Model**:
$$
PL^{CI}(f,d)[dB]=FSPL(f,1,m)+10nlog_{10}(\frac{d}{d_{o}})+X_{\sigma}^{Cl}
$$
Where the **$PL^{CI}(f,d)$** denotes the pass loss in dB over frequency and distance. The parameter **FSPL** is just the free space model in dB, **n** is the path loss exponent (PLE) to show how PL varies with multipath propagation distance and do is the reference distance which set to 1 m since there is rarely shadowing in the first meter and simplifies the equation as well.$X_{\tau}^{Cl}$ is the SF standard deviation describing large-scale signal fluctuations about the mean path loss over distance.



### **ML technique**

**Basic linear regression**
$$
Y_{i}=f_{i}(X)+\tau_{i}
$$
Y is the dependent response which is in our case the path loss, X is the independent variable,which is the channel state information (CSI) features such as distance, time delay, received power, azimuth AoD, elevation AoD, azimuth AoA, RMS Delay Spread, and frequency (GHz).

### Radio_propagation

**Radio propagation** is the behavior of [radio waves](https://en.wikipedia.org/wiki/Radio_wave) as they travel, or are [propagated](https://en.wikipedia.org/wiki/Wave_propagation), from one point to another, or into various parts of the [atmosphere](https://en.wikipedia.org/wiki/Atmosphere).



### Large_Scale

**Large-scale fading:** Due to path loss of signal as a function of distance and shadowing by large objects such as buildings and hills. This occurs as the mobile user moves through a distance of the order of the cell size, and is typically frequency independent. From the perspective of statistics, the large-scale fading satisfies the logarithmic normal distribution and its change rate is smaller than the data rate, which is why that it can be also called slow fading.



### LOS

 Line of sight (LoS) is a **type of propagation that can transmit and receive data only where transmit and receive stations** are in view of each other without any sort of an obstacle between them. 



### NLOS

**Non-line-of-sight** (**NLOS**) [radio propagation](https://en.wikipedia.org/wiki/Radio_propagation) occurs outside of the typical [line of sight](https://en.wikipedia.org/wiki/Line-of-sight_propagation) (LOS) between the transmitter and receiver, such as in [ground reflections](https://en.wikipedia.org/wiki/Ground_reflection). **Near-line-of-sight** (also **NLOS**) conditions refer to partial obstruction by a physical object present in the innermost [Fresnel zone](https://en.wikipedia.org/wiki/Fresnel_zone).

