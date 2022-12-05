function nbrRayons=calculerNombreRayons(m)
temp=(4*m)/pi+0.01*m;
nbrRayons=mod(temp,2)+temp;
end