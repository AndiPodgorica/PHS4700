function AfficherImage(posi, couleur)
    hold on;
    if (couleur == 1) %rouge
        plot3(posi(1), posi(2), posi(3), '.r');
    end
    
    if (couleur == 2) %cyan
        plot3(posi(1), posi(2), posi(3), '.c');
    end
    
    if (couleur == 3) %vert
        plot3(posi(1), posi(2), posi(3), '.g');
    end
    
    if (couleur == 4) %jaune
        plot3(posi(1), posi(2), posi(3), '.y');
    end
    
    if (couleur == 5) %bleu
        plot3(posi(1), posi(2), posi(3), '.b');
    end
    
    if (couleur == 6) %magenta
        plot3(posi(1), posi(2), posi(3), '.m');
    end
    hold off;
end