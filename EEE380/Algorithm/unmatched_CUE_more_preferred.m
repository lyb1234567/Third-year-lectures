function index=unmatched_CUE_more_preferred(unmatched_CUE_preference,link)
index=[];
    for i=1:size(link,2)
        if any(unmatched_CUE_preference==link(1,i))
            index(end+1)=find(unmatched_CUE_preference==link(1,i));
        end
    end
index=min(index);
end