function index=CUE_more_preferred(CUE_preference,link)
index=[];
    for i=1:size(link,2)
        if any(CUE_preference==link(1,i))
            index(end+1)=find(CUE_preference==link(1,i));
        end
    end
index=min(index);
end