function index=find_InfD_location(link,InfD)
    if any(InfD==link)
        index=find(InfD==link);
    else
        msg = 'The target link is not in InfD';
        error(msg);
    end
end