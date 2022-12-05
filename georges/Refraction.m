function [reflexionTotaleInterne, rayonRefracte] = Refraction(nint,next,rayon,n,point,entrerSphere)
reflexionTotaleInterne=false;
rayonRefracte={};

Ui=rayon.line_direction/norm(rayon.line_direction);

if entrerSphere
    Nt=nint;
    Ni=next;
else
    Nt=next;
    Ni=nint;
end

if (asin(Nt/Ni)>acos(dot(n/norm(n), Ui)))&&Ni>Nt
    reflexionTotaleInterne=true;
end

j=cross(Ui,n/norm(n));
j=j/norm(j);
k=cross(n/norm(n),j);
k=k/norm(k);
Si=dot(k,Ui);
St=Ni/Nt*Si;

Ut=-(n/norm(n))*sqrt(1-St^2)+k*St;
rayonRefracte=refractionRayon(Ut,point,rayon);
end
