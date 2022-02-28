function most_preferred=show_most_preferred(D_preference)
most_preferred=[];
for i=1:size(D_preference,1)
    preference_sub=D_preference{i,2};
    most_preferred(i,1)=preference_sub(1,1);
end
end