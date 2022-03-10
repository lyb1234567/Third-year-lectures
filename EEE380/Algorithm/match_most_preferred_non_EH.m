function proposal=match_most_preferred_non_EH(most_preferred,InfD_sub,InfD,unmatched_CUE)
proposal=containers.Map('KeyType','int32','ValueType','any');
for k=1:size(unmatched_CUE,2)
    proposal(k)=[];
end
for i=1:size(InfD_sub,2)
    link=InfD_sub(i);
    link_location=find_InfD_location(link,InfD);
    partner=most_preferred(i,1);
    a=proposal(partner);
    a(end+1)=link_location;
    proposal(partner)=a;
end
end