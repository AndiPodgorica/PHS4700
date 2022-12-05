function [reflexiontotaleInterne,rayonRefracte]=calculerRefraction(nint,next,rayon,n,point,entrerSphere)
[nt,ni]=calculerntni(entrerSphere,nint,next);
reflexiontotaleInterne=calculerReflexiontotale(nt,ni,n,rayon.line_direction);

j=calculerJ(n,rayon.line_direction);
k=calculerK(n,j);
Si=calculerSi(k,rayon.line_direction);
St=calculerSt(ni,ni,Si);

Ut=calculerUt(k,St,n);
rayonRefracte=refractionRayon(Ut,point,rayon);
end
