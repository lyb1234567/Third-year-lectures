### Computer Architecture

#### Program Counter

Let's say if we have five instructions, and some of them are probably very long. So the computer will split some of them into different slices and store the slices into the program memory.

Then the instruction register will fetch instructions from the instruction memory. Then the program counter will work.

| Instruction address | operands | address code |
| ------------------- | -------- | ------------ |
| 0                   | LDA      | 1000         |
| 1                   | ADD      | 1001         |
| 2                   | DEC      | 1200         |
| 3                   | JMP      | 7            |
| 4                   | LDA      | 2000         |
| 5                   | SUB      | 2001         |
| 6                   | INC      |              |

 **Remember when the program counter has reached jump operands in this case is the instruction address 7,  it will trigger the instruction JMP and just jump to the instruction address.**

#### Immediate Addressing

The simplest way for an instruction to specify an operand is for the address part of the instruction actually to contain the sperand itself rather than an address or other information describing where the operand is.

 Such an operand is called an immediate operand because it is automatically fetched from memory at the same time the instruction itself is fetched. It is immediately available for use.

```assembly
Ex:   LOAD R1, =100	  Load the number 100 to register R1.
```

![image-20211111142744307](C:\Users\elc20yl\AppData\Roaming\Typora\typora-user-images\image-20211111142744307.png)



### Direct Addressing

If the operands is memory address, it is direct addressing.

Direct addressing is a scheme in which the address specifies which memory word or register contains the operand.

For example:

```assembly
1) LOAD R1, 100	  Load the content of memory address 100 to register R1.

2) LOAD R1, R2	  Load the content of register R2 to register R1.
```





## Indirect Addressing

Indirect addressing is a scheme in which the address specifies which memory word or register contains not the operand but the address of the operand.

```assembly
For example:

1) LOAD R1, @100	Load the content of memory address stored at memory 
			address 100 to the register R1.

   			R1	M[100]		M[200]

			-	200		10
   LOAD R1,@100		10	200		10
			


2) LOAD R1, @R2		Load the content of the memory address stored at

			register R2 to register R1.
```

