function [reflexionTotaleInterne, rayonRefracte] = Refraction(nint,next,rayon,n,point,entrerSphere)
[Nt,Ni]=calculerNtNi(entrerSphere,nint,next);

if (asin(Nt/Ni)>acos(dot(n/norm(n),rayon.line_direction/norm(rayon.line_direction))))&&Ni>Nt
    reflexionTotaleInterne=true;
else
    reflexionTotaleInterne=false;
end

j=cross(rayon.line_direction/norm(rayon.line_direction),n/norm(n));
j=j/norm(j);
k=cross(n/norm(n),j);
k=k/norm(k);
Si=dot(k,rayon.line_direction/norm(rayon.line_direction));
St=Si*(Ni/Nt);

Ut=k*St+sqrt(1-St^2)*-(n/norm(n));
rayonRefracte=refractionRayon(Ut,point,rayon);
end
