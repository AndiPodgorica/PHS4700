classdef BlocColors < Bloc
    %BlocColors les faces sont decrites si on est a la position [0,0,0] et
    %qu on regarde dans la direction des Y positifs
    % ce bloc n a pas d indice de refraction, c est pourquoi celui ci est
    % setter a 0 dans le constructeur
    
    properties
        FaceSuperieur,
        FaceInferieur,
        FaceAvant,
        FaceArriere,
        FaceGauche,
        FaceDroite
    end
    
    methods
        function obj = BlocColors(lar, long, haut, indice, cdm)
            
            obj = obj@Bloc(lar, long, haut, indice, cdm);
            
            obj.n = 0;
            obj.FaceAvant = Color.Rouge;
            obj.FaceArriere = Color.Cyan;
            obj.FaceDroite = Color.Vert;
            obj.FaceGauche = Color.Jaune;
            obj.FaceSuperieur = Color.Magenta;
            obj.FaceInferieur = Color.Bleu;
        end
        
        function couleur = GetCouleur(obj, i)
            switch i
                case 1
                    couleur = obj.FaceSuperieur;
                case 2
                    couleur = obj.FaceInferieur;
                case 3
                    couleur = obj.FaceAvant;
                case 4
                    couleur = obj.FaceArriere;
                case 5
                    couleur = obj.FaceGauche;
                case 6
                    couleur = obj.FaceDroite;
            end
        end
            
    end
    
end

