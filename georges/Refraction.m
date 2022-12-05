function [reflexionTotaleInterne, rayonRefracte] = Refraction(problem, rayon, normale, point, entrerSphere)

reflexionTotaleInterne=false;
rayonRefracte={};

if entrerSphere
    Nt=problem.param.n_int;
    Ni=problem.param.n_ext;
else
    Nt=problem.param.n_ext;
    Ni=problem.param.n_int;
end

i=normale/norm(normale);
Ui=rayon.line_direction/norm(rayon.line_direction);

if Ni>Nt
    if real(asin(Nt/Ni))<real(acos(dot(i, Ui)))
        reflexionTotaleInterne=true;
        return;
    end
end

j=cross(Ui, i);
j=j/norm(j);
k=cross(i, j);
k=k/norm(k);
Si=dot(k,Ui);
St=Ni/Nt*Si;

Ut=-i*real(sqrt(1-St^2))+k*St;
rayonRefracte=refractionRayon(Ut,point,rayon);

end
