### Probability of error and channel coding

For a single hop there are four possibilities:

1. We send a '1' and receive a '1'.
2. We send a '0' and receive a '0'.
3. We send a '1' and receive a '0'
4.  We send a '0' and receive  a '1'

![image-20211013094448060](C:\Users\admin\AppData\Roaming\Typora\typora-user-images\image-20211013094448060.png)

So the total probability of error is:

$P_{\epsilon}=P_{(0|1)}*P_{1}+P_{(1|0)}*P_{(0)}$

where $P_{(0|1)}$ is the probability of receiving a 0 given that a 1 was transmitted and $P_{(1)}$is the probability that a 1 was transmitted.

同时在这个混乱的系统中，我们假设的是 发送 1 和 发送 0的 可能性是一样的，所以公式也可以写成
$$
P_{\epsilon}=p*P_{(1)}+p*P_{(0)}=p*(P_{(1)}+P_{(0)})
$$
For a binary system $(P_{(1)}+P_{(0)})=1$

so $P_{\epsilon}=p$ which is the bit error rate.

但是假如，我们在 A B直接增加了一个repeater C

![image-20211013094534251](C:\Users\admin\AppData\Roaming\Typora\typora-user-images\image-20211013094534251.png)

因为A 到 C 的距离是A 到B 距离的一半， 这意味着 A 到 C 的 可能性 $P_{1}$是远远小于， 整个系统$A\rightarrow B$ 的 可能性 是依旧为$p$的。

