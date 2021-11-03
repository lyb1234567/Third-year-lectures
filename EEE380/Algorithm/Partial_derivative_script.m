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