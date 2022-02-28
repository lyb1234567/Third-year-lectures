function index=find_EhaD_location(link,EhaD)
    link
    EhaD
    if any(EhaD==link)
        index=find(EhaD==link);
    else
        msg = 'The target link is not in EhaD';
        error(msg);
    end
end