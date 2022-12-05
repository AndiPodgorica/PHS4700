function [reflexiontotaleInterne,rayonRefracte]=calculerRefraction(nint,next,rayon,n,point,entrerSphere)
[nt,ni]=calculerntni(entrerSphere,nint,next);
reflexiontotaleInterne=calculerReflexiontotale(nt,ni,n,rayon.line_direction);

j=calculerJ(n,rayon.line_direction);
k=calculerK(n,j);
si=calculersi(k,rayon.line_direction);
st=calculerst(ni,ni,si);

Ut=calculerUt(k,st,n);
rayonRefracte=refractionRayon(Ut,point,rayon);
end
