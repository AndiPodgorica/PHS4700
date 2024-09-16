function [estCollision, collisionSphereEnglobante, point, normale] = EtatCollision(autoA, autoB, positionA, positionB, tempsEcoule, tempsDebutRotationB)
    %Utilise une stratégie mixte : On teste en premier si les solides sont
    %en collision avec leurs sphères englobantes, si non, alors on passe à
    %la méthode des plans de division

    point = [0 0];
    normale = [0 0];

    if (~isa(positionA, 'Vecteur'))
        posA = Vecteur.CreateFromArray(positionA);
    else
        posA = positionA;
    end
    
    if (~isa(positionB, 'Vecteur'))
        posB = Vecteur.CreateFromArray(positionB);
    else
        posB = positionB;
    end
    
    
    [collisionSphereEnglobante] = InteresectionSpheresEnglobantes(autoA, autoB, posA, posB);
    if (~collisionSphereEnglobante)
        estCollision = false;
        return;
    end

    coinsA = CalculerCoinsVehicule(autoA, posA, tempsEcoule); %Auto A commence a tourner des le debut
    coinsB = CalculerCoinsVehicule(autoB, posB, max(tempsEcoule - tempsDebutRotationB, 0)); %Auto B ne commence a tourner qu'au temps tb

    [estCollision, point, normale] = IntersectionDeuxSolides(coinsA, coinsB);

end


function [estCollision, point, normale] = IntersectionDeuxSolides(coinsSolideA, coinsSolideB)
    %Determine si deux solides sont en collision
    
    estCollision = false;
    point = [0 0];
    normale = [0 0];
    for i = 1:(numel(coinsSolideB) / 2)
        [pointInclus, n] = PointInclusDansSolide(coinsSolideB(i,:), coinsSolideA);
        if (pointInclus)
            normale = n;
            point = coinsSolideB(i,:); %Return ce point
            estCollision = true;
        end
    end
        
    for i = 1:(numel(coinsSolideA) / 2)
        [pointInclus, n] = PointInclusDansSolide(coinsSolideA(i,:), coinsSolideB);
        if (pointInclus)
            normale = n;
            point = coinsSolideA(i,:); %Return ce point
            estCollision = true;
        end
    end

end

function index = GetProchainIndexAvecLoop(indexActuel, minVal, maxVal)
    %ex (1, 1, 4), va retourner 2
    %ex (4, 1, 4), va retourner 1
    index = max(mod(indexActuel + 1, (maxVal + 1)), minVal);
end

function [interieur, normale] = PointInclusDansSolide(point, coinsSolide)
    %Determine si un point est inclus dans un solide
    
    interieur = true;
    normale = [0 0];
    plusPetiteDistance = Inf;

    indexMax = (numel(coinsSolide) / 2);
    for i = 1:indexMax
        indexDeuxiemeCoin = GetProchainIndexAvecLoop(i, 1, indexMax); %On prend prochain, mais on retourne à 1 au lieu de 5
        n = CalculerPlanSeparateur(coinsSolide(i,:), coinsSolide(indexDeuxiemeCoin,:));
        
        distance = DistancePlanCoin(n, coinsSolide(i,:), point);
        
        if (distance < 0 && abs(distance) < abs(plusPetiteDistance))
            plusPetiteDistance = distance;
            normale = n;
        end
        if (distance > 0)
            interieur = false;
        end
        
    end
    
    if (~interieur)
        normale = [0 0];
    end
    
end

function [intersection] = InteresectionSpheresEnglobantes(autoA, autoB, cmA, cmB)
    %Définit une sphère qui englobe chacune des autos, puis détermine s'il
    %y a collision entre les sphères
    
    rayonA = ((autoA.Longueur / 2) ^ 2 + (autoA.Largeur / 2) ^ 2)^(1/2); %Pythagore pour trouver rayon de la sphere englobante
    rayonB = ((autoB.Longueur / 2) ^ 2 + (autoB.Largeur / 2) ^ 2)^(1/2);
    
    distance = CalcDistance(cmA, cmB);
    intersection = (distance < (rayonA + rayonB) * 1.1); %Ajouter 10%, pour gérer les cas où les 2 autos s'approchent par les coins
end

function euclideanDistance = CalcDistance(p1, p2) 
    %Imite la fonction pdist
    
    if (~isa(p1, 'Vecteur'))
        p1 = Vecteur.CreateFromArray(p1);
    end
    
    if (~isa(p2, 'Vecteur'))
        p2 = Vecteur.CreateFromArray(p2);
    end
    euclideanDistance = sqrt((p2.X - p1.X)^2 + (p2.Y - p1.Y)^2);
end

function normale = CalculerPlanSeparateur(coin1, coin2)
    %Par convention, on s'assure que les coins sont disposés en sens antihoraire
    %Lorsqu'on regarde la face définie par les coins 1 et 2, on veut que le
    %coin 1 soit à droite et le coin 2 à gauche. On crée ensuite
    %dynamiquement un coin 3 situé sous le coin 2. Vue de face :
    % 2---1
    % |   |
    % |   |
    % 3---
    
    coin1(3) = 1;
    coin2(3) = 1;
    
    coin3 = coin2;
    coin3(3) = 0; %On met le coin 3 en dessous du coin 2, la valeur de Z n'est pas importante pour le calcul de la normale
    
    pk1 = coin1 - coin2;
    pk2 = coin1 - coin3;
    
    normale = cross(pk1, pk2) / norm(cross(pk1, pk2));
    normale = [normale(1) normale(2)]; %Exclure la dimension Z
end

function distance = DistancePlanCoin(normale, pointPlan, coinAutreSolide)
    %Applique la formule de distance entre le plan qui contient qk1 et un coin rij
    %di,j,k = nk ·(ri,j ? qk,1) (p. 113 Manuel de référence)
    
    distance = dot(normale, (coinAutreSolide - pointPlan));
end
