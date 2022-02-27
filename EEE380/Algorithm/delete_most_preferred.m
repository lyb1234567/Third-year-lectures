function new_preference=delete_most_preferred(original_preference)

for i=1:size(original_preference,2)
    preference_sub=original_preference{i,2};
    preference_EE=original_preference{i,1};
    preference_sub(1)=[];
    original_preference{i,2}=preference_sub;
    preference_EE(1)=[];
    original_preference{i,1}=preference_EE;
end
new_preference=original_preference;
end