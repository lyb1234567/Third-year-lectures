function proposal=match_most_preferred_comparison(most_preferred,D2D_sub,CUE)
proposal=containers.Map('KeyType','int32','ValueType','any');

for k=1:size(CUE,1)
    proposal(k)=[];
end

for i=1:size(D2D_sub,2)
    partner=most_preferred(i,1);
    link=D2D_sub(i);
    a=proposal(partner);
    a(end+1)=link;
    proposal(partner)=a;
end
end