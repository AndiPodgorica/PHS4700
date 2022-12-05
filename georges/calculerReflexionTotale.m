function estReflexion=calculerReflexionTotale(Nt,Ni,n,direction)
if (asin(Nt/Ni)>acos(dot(n/norm(n),direction/norm(direction))))&&Ni>Nt
    estReflexion=true;
else
    estReflexion=false;
end
end