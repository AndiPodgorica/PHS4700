function estReflexion=calculerReflexionTotale(Nt,Ni,n,direction)
if (acos(dot(n/norm(n),direction/norm(direction)))<asin(Nt/Ni))&&Ni>Nt
    estReflexion=true;
else
    estReflexion=false;
end
end