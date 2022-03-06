function show_partner(EhaD,partner)
show=[];
for i=1:size(EhaD,2)
    show(end+1)=partner(EhaD(i));
end
show
end