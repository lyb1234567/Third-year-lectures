function new=clean_most_preferred(most_preferred,EhaD_sub,EhaD)
new=[];
for i=1:size(EhaD_sub,2)
    link=EhaD_sub(i);
    EhaD_location=find_EhaD_location(link,EhaD);
    new(i,1)=most_preferred(EhaD_location,1);
end
end