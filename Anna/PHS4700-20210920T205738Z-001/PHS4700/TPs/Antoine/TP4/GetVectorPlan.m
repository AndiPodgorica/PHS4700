function p= GetVectorPlan (plan, obs)

    % premier coin du plan
    p0 = plan.Sommets(:,1);
    
    % vecteurs orthogonaux
    v1 = plan.Sommets(:,2) - p0;
    v2 = plan.Sommets(:,4) - p0;
    u1 = v1 / norm(v1);
    u2 = v2 / norm(v2);
    
    % Verification de la validite des vecteurs orthogonaux
    if cross(cross(v1, v2), plan.n) ~= 0
       error('Erreur! Les vecteurs du plan ne sont pas orthogonaux'); 
    end
    
    dimCarre = 0.1; %carres de 0.1 cm × 0.1 cm
    
    % dv avec le pas dimCarre
    d1 = u1 * dimCarre;
    d2 = u2 * dimCarre;
    
    % Nombre de divisions
    cnt1 = round((norm(v1) / dimCarre));
    cnt2 = round((norm(v2) / dimCarre));
    
    droites = [];
    
    for i=1:cnt1
        for j=1:cnt2
            u = p0 + d1 * i + d2 * j;
            u = u - obs.Position;
            u = u / norm(u);
            v = Droite(u, obs.Position);
            droites = [droites v];
        end
    end

    p = droites;
    
end