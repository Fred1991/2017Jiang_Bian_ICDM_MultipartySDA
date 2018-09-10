
for i=1:365 
    if (0.5 * 365^i) >= prod(i:365) 
        n=i;
        break;
    end 
end
    