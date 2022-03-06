function check=check_element_in_CUE_preference(CUE_preference,target)
check=false;
for i=1:size(target,2)
    if any(CUE_preference==target(i))
        check=true;
        break;
    end
end
end