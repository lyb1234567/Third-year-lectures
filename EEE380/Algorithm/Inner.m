function [lambda_ij,P_ij,EE_ij]=Inner(EhaD,S_iD)
syms Initial_QiD Initial_P_iD P_iR
%According to the reference paper, they set a very small positive value to
%initial QiD
QiD=[];
QiD(1)=Initial_QiD;
%Set the iteration step
t=0;

%Set the allowed iteration number
I=0;
Psi=0;
%assign the initial value of transmission power of D2D link to the set.
PiD=[];
PiD(1)=Initial_P_iD;

%First of all we need to determine the maximum segments before we get
%started with the algorithm, according 
