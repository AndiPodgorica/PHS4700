function masse=trouverMasse(temps)
masseFusee= 20*1000; %Masse initiale totale fusee(kg)
qteInitialeCarburant=300*1000; %Quantite initiale du carburant (kg)
masse=(masseFusee+qteInitialeCarburant)-(1200*temps);
    if masse<masseFusee
        masse=masseFusee;
    end
end