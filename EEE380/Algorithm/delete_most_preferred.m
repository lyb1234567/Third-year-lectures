function new_preference=delete_most_preferred(original_preference)

for i=1:size(original_preference,1)
    preference_sub=original_preference{i,2};
    if size(preference_sub,2)>=2
        preference_sub(1)=[];
        original_preference{i,2}=preference_sub;
    end
end
new_preference=original_preference;
end