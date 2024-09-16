function distance = DistanceParcourue(p1, p2)
    %Imite la fonction pdist
    if (~isa(p1, 'Vecteur'))
        p1 = Vecteur.CreateFromArray(p1);
    end
    if (~isa(p2, 'Vecteur'))
        p2 = Vecteur.CreateFromArray(p2);
    end
    
    distance = sqrt((p2.X - p1.X)^2 + (p2.Y - p1.Y)^2 + (p2.Z - p1.Z)^2);
end