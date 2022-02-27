function [matched_partner]=stable(EhaD,Sid,D2D_preference,CUE_preference)

mateched_partner=containers.Map('KeyType','int32','ValueType','int32');
unmatched_D2D=[];
proposal=containers.Map('KeyType','int32','ValueType','any');
for k=1:size(Sid,1)
    proposal(k)=[];
end
remove_D2D=[];
while size(EhaD,2)>0
    for i=1:size(EhaD,2)
        preference=D2D_preference{i,2};
        most_preferred=preference(1,1);
        a=proposal(most_preferred);
        a(end+1)=EhaD(i);
        proposal(most_preferred)=a;
        partner=Sid{i,1};
        for k=1:size(partner,1)
            proposal_k=proposal(k);
            %检查得到的proposal 矩阵里面是否有EhaD(i)
            check=any(proposal_k==EhaD(i));
            if check
                if size(proposal_k,2)==1
                    matched_partner(EhaD(i))=k;
                    remove_D2D(end+1)=EhaD(i);
                elseif size(proposal_k,2)>1
                    find=false;
                    for n=1:size(proposal_k,2)
                        %假如说总共收到不止一个D2D link 的proposal,那么我们就需要检查这其中是否有D2D
                        %link只有1一个proposal要发出
                        proposal_k
                        D2D_preference_n=D2D_preference{proposal_k(1,n),2};
                        if size(D2D_preference_n,2)==1
                            find=true;
                            matched_partner(proposal_k(1,n))=k;
                            remove_D2D(end+1)=proposal_k(1,n);
                            break;
                        end
                    end
                    if find==false
                         most_preferred_CUE=CUE_preference{k,2}(1);
                         matched_partner(most_preferred_CUE)=k;
                         remove_D2D(end+1)=most_preferred_CUE;
                    end
                end
            end
        end
    end
    new_EhaD=remove(EhaD,remove_D2D);
    EhaD=new_EhaD;
    new_D2D_preference=delete_most_preferred(D2D_preference);
    D2D_preference=new_D2D_preference;
end
end