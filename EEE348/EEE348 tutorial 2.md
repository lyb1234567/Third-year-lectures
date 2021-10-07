### `EEE348 tutorial 2

### FET

![image-20211005194905778](C:\Users\admin\AppData\Roaming\Typora\typora-user-images\image-20211005194905778.png)

图中 step部分表明，要使用阶梯式的电压。 而图中{vgs}，表示用户自定义的一个parameter叫做vgs.

而0，3.3 1表示，vgs，输出电压将从0增加到3.3v,且每次增值1v。

![1](C:\Users\admin\AppData\Roaming\Typora\typora-user-images\image-20211005195326247.png)

run 完之后，就可以看到FET的基本性质了：

![image-20211005195544627](C:\Users\admin\AppData\Roaming\Typora\typora-user-images\image-20211005195544627.png)

可以看到Id并不随 vds变化



### Inverter

![image-20211005223456839](C:\Users\admin\AppData\Roaming\Typora\typora-user-images\image-20211005223456839.png)

经典的Inverter

图像

`![image-20211005224058896](C:\Users\admin\AppData\Roaming\Typora\typora-user-images\image-20211005224058896.png)

The output is guaranteed to be seen as a "1" or "0", since the range of the voltage occupied byoutput is samller than the range of the voltage occupied by the input.



In order to make the midlane the same, we have to make one of the transisitor wider.

但是可以看到的是，不是完全高电平或者低电平，这就是为什么需要电容。
