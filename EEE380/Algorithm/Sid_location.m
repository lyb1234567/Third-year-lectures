function index=Sid_location(Sid,CUE_coord)
index=-1;
for k=1:size(Sid,1)
    if CUE_coord(1,1)==Sid(k,1) && CUE_coord(1,2)==Sid(k,2)
        index=k;
        break;
    end
end
end