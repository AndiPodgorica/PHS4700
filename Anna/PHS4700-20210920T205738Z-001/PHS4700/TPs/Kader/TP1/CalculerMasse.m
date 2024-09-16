function masse = CalculerMasse(type,r,l,ro)
    if(type == "sphere")
        volume = (4*pi*(r)^3)/3; %volume sphere
    else
        volume = pi*(r^2)*l;  %volume cylindre
    end
    
    masse = ro*volume;
end