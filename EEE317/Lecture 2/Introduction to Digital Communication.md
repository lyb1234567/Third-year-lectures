# Introduction to Digital Communication

### Difference between analogue and Digital

Analogue: Take infinite symbols

Digital: Take finite set of symbols



### Channel coding

**To improve error detection and correction**

Let's say we send a 1 and zero to the receiver and during the transmission, the signal was changed to 0 and another was changed to 1, and the receiver will receive a 0 and we will not know the signal we get is correct or not since from the transmitter, it only transmits one symbol.



But if we add a 0 to both of the symbols like:

  01 

  00



And during the transmission, if the errors again like:

11

10

We can detect the error immediately since they are either  01 or 00

The "0" we add is redundant bits.



### Source coding

**To improve the data rates**



### Multiplexing

**To share a resource**

- Frequency division multiple access

![image-20211005115525383](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211005115525383.png)

 We share the bandwidth with many users. Each users is allocated part of the bandwidth all the time.



-   Time division multiple access

![image-20211005120012459](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211005120012459.png)

Each user is allocated all the bandwidth part of the time.

Limit: At the receiver we need the synchronization, we need to know when each user will start the transimisson



- Code division multiple access

![image-20211005120502363](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211005120502363.png)

**It will combine the advantages of TDMA and FDMA**

It will choose which part of the available bandwidth the signal will be transmitted in. Many signals are transmitted over the same bandwidth, but because the codes are different, the signals don't interfere



### Regeneration

In  an analogue system  a transmission repeater amplifies both the signals and noises

![image-20211005121746402](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211005121746402.png)

This is very inefficient!!

![image-20211005122244629](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211005122244629.png)

In the first stage, we introduce some errors so we don't amplify the signal instead we use the  channel coding to analyse the signal (like what errors have been introduced)and start the whole process again