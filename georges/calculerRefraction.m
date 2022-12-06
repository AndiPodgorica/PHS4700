function [reflexiontotaleInterne,rayonRefracte]=calculerRefraction(nint,next,rayon,n,point,entrerSphere)
[nt,ni]=calculerntni(entrerSphere,nint,next);
reflexiontotaleInterne=calculerReflexiontotale(nt,ni,n,rayon.ligneU);

j=calculerJ(n,rayon.ligneU);
k=calculerK(n,j);
si=calculersi(k,rayon.ligneU);
st=calculerst(ni,ni,si);

Ut=calculerUt(k,st,n);
rayonRefracte=refractionRayon(Ut,point,rayon);
end
