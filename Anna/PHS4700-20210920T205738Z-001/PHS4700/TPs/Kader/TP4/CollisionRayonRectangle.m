function [P, emplacement] = CollisionRayonRectangle(r0, rt, A, B, C, D)
    %r0: point d attache de la droite; rt: vecteur directeur de la droite;
    %A, B, C, D: les 4 coins du rectangle
    
    %la normale du plan
    n = cross(B-A,C-A)
    d = -dot(n,A)
    % Equation du plan
    plan = [n(1); n(2); n(3); d]
    
    [P, type] = IntersectionDroitePlan(r0,rt,plan)
    
    %verifier si le point est à l'interieur du rectangle
    %1-calculer la surface du rectangle
    %2-calculer la surface des 4 triangles APD,DPC,CPB,PBA
    %3-si la somme des surface est egale à la surface de rectangle il est
    %donc à l interieur 
    if type == "point"
        AP = P - A
        AD = D - A
        SAPD = 0.5*norm(cross(AP,AD))
        DP = P - D
        DC = C - D
        SDPC = 0.5*norm(cross(DP,DC))
        CP = P - C
        CB = B - C
        SCPB = 0.5*norm(cross(CP,CB))
        PB = B - P
        PA = A - P
        SPBA = 0.5*norm(cross(PB,PA))
        SRectangle = norm(CB)*norm(DC)
        Somme = SAPD + SDPC + SCPB + SPBA        

        if Somme > SRectangle
            emplacement = "out"
        elseif SAPD == 0 || SDPC == 0 || SCPB == 0 || SPBA == 0
            emplacement = "on"
        else
            emplacement = "in"
        end
    else
        emplacement = "out"
end