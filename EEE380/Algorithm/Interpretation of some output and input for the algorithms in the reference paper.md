Date:2021-12-06

### Interpretation of some output and input for the algorithms in the reference paper



#### Algorithm 1: Prematching Algorithm

For Algorithm 1, the output **EhaD and InfD** should be a row vector which has links from input D2D link set. And **EhaD ** is a group set which has links from the previous D2D link set that can perform SWIPT. And the **InfD ** is also a group  set which has links from the previous D2D links that can not perform SWIPT.

And the output **SiD** should be a matrix of which each row should has CUE that can help corresponding D2D link perform **SWIPT**.



### Algorithm 3: Inner loop Algorithm

For Algorithm 3, for each D2D link i paired with CUE k, their output transmission power $P_{i,j}^{D}$ $EE_{i}^{D}$,$\lambda_{i,j}^{e}$, they should have Nmax segments. So, for each D2D link i paired with CUE k, they should be a row vector: $EE_{i,k}^{D}=[EE_{i,1},EE_{i,2}\dots,EE_{i,Nmax}]$ for CUE k same for $P_{i,k}^{D}$ ,$\lambda_{i,k}^{e}$ .



### Algorithm 2: Outer loop Algorithm

For Algorithm 2, based on results from Algorithm 3 above, for each D2D link i paired with CUE k, they should Nmax output for corresponding variables. So for each D2D link i paired with CUE k, we should find the  maximum value of EE and the corresponding segment j, then we can use the j to find other output parameters $P_{i}^{D}$, $EE_{i}^{D}$,$\lambda_{i}^{e}$.  

Then we now know that for each D2D link i paired with CUE k, they should only have one value

$P_{i,k}^{D}$=a, $EE_{i}^{D}$=b, $\lambda_{i}^{e}$=c



So for each D2D link i, it should have N corresponding transmission power $P_{i}^{D}=[a_{1},a_{2},\dots,a_{k},\dots a_{N}]$, $EE_{i}^{D}=[b_{1},b_{2},\dots,b_{k},\dots,b_{N}]$, $\lambda_{i}^{e}=[c_{1},c_{2},\dots,c_{k}\dots,c_{N}]$, where N is the CUE number.

 **They are not sorted in descending order or ascending order**.



### Algorithm for preference list

Before implementing the Algorithm 4, we to establish preference lists for D2D links and CUEs.

And to build the preference for the SWIPT-Enabled D2D link group, we need to do it by sorting the Energy efficiency. To build most preferred one, we need to sort the Energy efficiency in descending order. Remember that the Energy Efficiency should be a Matrix, for Each D2D i, it should have N value where N is the CUE number.

So,The output partner selection for D2D group should be:$\ohm_{i}^{1},\ohm_{i}^{2},\ohm_{i}^{3},\dots,\ohm_{i}^{k}$ , same for the CUE partner selection: $\ohm_{k}^{1},\ohm_{k}^{2},\ohm_{k}^{3},\dots,\ohm_{k}^{i}$



