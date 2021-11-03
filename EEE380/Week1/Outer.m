function [Pid_optimal,lambda_optimal,EE_optimal]=Outer(EhaD,SiD,lambda,P_ijD,EE_ijD)

for i =EhaD
    for k=SiD
        for j=1:Nmax
            [argvalue,argmax]=max(EE_ijD(i:j));
            j_optimal=argmax;
            Pid_optimal=P_ijD(i,j_optimal);
            lambda_optimal=lambda(i,j_optimal);
            EE_optimal=EE_ijD(i,j_optimal);
        end
    end
end