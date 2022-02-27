function new_array=remove(original,target)
for i=1:size(target,2)
    if any(original==target(1,i))
        original(original==target(1,i))=[];
    elseif ~any(original==target(1,i))
        msg = 'The current target is not in the array';
        error(msg);
    end
end
new_array=original;
end