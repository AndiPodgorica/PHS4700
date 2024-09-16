function estAberrant=pointEstAberrant(nbrDiminue,intersection,valeurHaut,valeurBas)
estAberrant=false;
for i=1:nbrDiminue
    if intersection(i)>valeurHaut(i)||intersection(i)<valeurBas(i)
        estAberrant=true;
        return;
    end
end
end