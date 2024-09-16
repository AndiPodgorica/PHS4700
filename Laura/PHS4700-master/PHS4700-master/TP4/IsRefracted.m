function [uf, isRefracted] = IsRefracted(n1, n2, u, i)
 
    u = u/norm(u);

    il = i;
    il = il/norm(il);
    jl = cross(u, il)/norm(cross(u, il));
    kl = cross(il, jl);

    s1 = dot(kl, u);
    s2 = s1*(n1/n2);

    if( abs(s2) <= 1)
        uf = s2*kl - il*(sqrt(1-(s2^2)));
         isRefracted = true;
        
    else
        uf= u - 2*il*dot(u,il);
        uf = uf/norm(uf);
        %uf = s1*kl + il*(sqrt(1-(s1^2)));
        isRefracted = false; %reflexion
       
        
    end
end