syms  T_id p_id h_id p_ir Q_id EC_id EH_id p_kc h_ki N0 N1 kj bj pmax lambda T_ic T_dmin T_cmin P_th1 beta alpha gamma delta in 

%Partial derivative of Lagrange functions with respect to power splitting
%ratiro λ: lambda
A=1+(p_id*h_id)/((p_kc*h_ki+N0)+(N1/(1-lambda)));
T_id=log2(A);
p_ir=lambda*(p_id*h_id+p_kc*h_ki+N0);
EH_id=kj*p_ir+bj;
EC_id=p_id+2*p_ir-EH_id;
L=T_id-Q_id*EC_id-alpha*(p_id-pmax)-beta*(lambda-1)+gamma*(T_id-T_dmin)+delta*(T_ic-T_cmin)+in*(p_ir-P_th1);
d_lambda=diff(L,lambda);

%Partial derivative of Lagrange functions with respect transmission power
%P_id
d_pid=diff(L,p_id);


%when transmission power is fixed, we can get the optimal power splitting ratio
%lambda
syms a1 a2 a3 K G H J
G=p_id*h_id;
H=p_kc*h_ki+N0;
K=beta+(Q_id+in)*kj*(G+H);
J=G*N1*log2(exp(1))*(1+gamma);
a1=K*(G*H+H*H);
a2=K*(G+2*H)*N1;
a3=K*N1*N1-J;
lam1=(-a2+sqrt(a2*a2-4*a1*a3))/(2*a1);
lam2=(-a2-sqrt(a2*a2-4*a1*a3))/(2*a1);
lam3=0;
optimal_lambda_matrix=[lam1 lam2 lam3];
optimal_lambda=max(optimal_lambda_matrix);


%when power splitting ratio has been fixed, we can get the optimal
%transmisson power from D2D links communication Pid, and in this case a
%piecewise function will be used.
syms m1 m2 m3 m4 m5 m6 b1 b2 b3 b4 h_iB e_ta h_kc XN YN g phi theta P1 P_optimal
n=[0 1 2];
m1=(1+gamma)*h_id*log2(exp(1));
m2=p_kc*h_ki+N0+((N1)/(1-lambda));
m3=Q_id*(1+(1-lambda)*e_ta*h_id-(kj*h_id))+alpha-(in*lambda*kj*h_id);
m4=p_kc*h_kc*h_iB*log2(exp(1))*delta;
m5=N0+N1;
m6=p_kc*h_kc;
b1=m3*h_id*h_iB*h_iB;
b2=(2*m3*m5+m3*m6)*h_id*h_iB-(m1-m2*m3)*h_iB*h_iB;
b3=(m3*m5*m5+m3*m5*m6+m4)*h_id-(2*m1*m5+m1*m6-2*m2*m3*m5-m2*m3*m6)*h_iB;
b4=m2*m4+m2*m3*m5*m5+m2*m3*m5*m6-m1*m5*m5-m1*m5*m6;
XN=(-m2/(3*m1));
YN=(2*b2^3)/(27*b1^2)-((b2*b3)/(3*b1))+b4;
g=2*b1*sqrt((b2*b2-3*b1*b3)/(9*b1*b1))^3;
phi=(1/3)*acos(-YN/g);
theta=sqrt((m2*m2-3*m1*m3)/(9*m1*m1));
P1=piecewise(YN^2>g^2,XN+((-YN+sqrt(YN^2-g^2))/(2*a1))^(1/3),YN^2<g^2,XN+2*theta*cos(phi-n*(2*pi)/3),XN-theta | XN+2*theta);


