function [Pid_optimal,lambda_optimal,EE_optimal]=Outer(EhaD,SiD,lambda,P_ijD,EE_ijD)

%first of all, we need to search the whole SWIPT-Enabled D2D communication
%system, then search for the partner selection set obtained by the
%pre-matching algorithm. Then we set Nmax segments first then search them,
%for each segment, we need to find the maxmimum Energy Efficiency of each
%segment and the j value at which Energy efficiecny reaches its maximum
%value, then update the optimal value of J, transmission power PiD_optimal,
%power plitting ratio lambda_optimal, and ofcourse the energy efficiency EE_optimal
for i =1:size(Ehad,2)
    for k=1:size(SiD,2)
        for j=1:Nmax
            [argvalue,argmax]=max(EE_ijD(i:j));
            j_optimal=argmax;
            Pid_optimal=P_ijD(i,j_optimal);
            lambda_optimal=lambda(i,j_optimal);
            EE_optimal=EE_ijD(i,j_optimal);
        end
    end
end