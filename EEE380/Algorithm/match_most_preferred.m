function proposal=match_most_preferred(most_preferred,EhaD_sub,EhaD,CUE,Sid)
proposal=containers.Map('KeyType','int32','ValueType','any');

for k=1:size(CUE,1)
    proposal(k)=[];
end
for i=1:size(EhaD_sub,2)
    link=EhaD_sub(i);
    link_location=find_EhaD_location(link,EhaD);
    partner=most_preferred(i,1);
    Sid_sub=Sid{link_location,1};
    most_preferred_coordinate=Sid_sub(partner,:);
    most_preferred_location=location_CUE(CUE,most_preferred_coordinate);
    a=proposal(most_preferred_location);
    a(end+1)=link_location;
    proposal(most_preferred_location)=a;
end
end