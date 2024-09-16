classdef MomentInertie
    methods(Static)
        
        function [inertie] = InertieCone( masse, rayon, hauteur )
            %matrice de base
            inertie = [1, 0, 0 ;0, 1, 0;0, 0, 1];
            
            %Ic,xx = m(12r^2+3h^2)/80
            Ic_xx = masse * (((12 * (rayon^2) + 3 * (hauteur^2))) / 80);
                
            %Ic,yy = %Ic,xx = m(12r^2+3h^2)/80
            Ic_yy = Ic_xx;
                
            %Ic,zz = m(3r^2/10)
            Ic_zz = masse * ((3*(rayon^2)) / 10);
            
            inertie(1,1) = Ic_xx;
            inertie(2,2) = Ic_yy;
            inertie(3,3) = Ic_zz;
        end
        
        function [inertie] = InertieCylindre( masse, rayon, hauteur )
            %matrice de base
            inertie = [1, 0, 0 ;0, 1, 0;0, 0, 1];
            
            %Ic,xx = (m/4)*(r^2) + (m/12)*(l^2)
            Ic_xx = ((masse/4) * (rayon^2)) + ((masse/12) * (hauteur^2));
                
            %Ic,yy = %Ic,xx = (m/4)*(r^2) + (m/12)*(l^2)
            Ic_yy = Ic_xx;
                
            %Ic,zz = (m/2)*(r^2)
            Ic_zz = (masse/2) * (rayon^2);
            
            inertie(1,1) = Ic_xx;
            inertie(2,2) = Ic_yy;
            inertie(3,3) = Ic_zz;
        end 
   
        function [inertieAjustee] = InertieAjusteeCM( inertieObjet, masseObjet, cmObjet, cmGlobal )
                
                dx = cmGlobal(1) - cmObjet(1);
                dy = cmGlobal(2) - cmObjet(2);
                dz = cmGlobal(3) - cmObjet(3);
                
                inertieAjustee = [0 0 0 ;0 0 0;0 0 0];
                
                inertieAjustee(1,1) = inertieObjet(1,1) + masseObjet * (dy^2 + dz^2);
                inertieAjustee(1,2) = inertieObjet(1,2) + masseObjet * (-dx * dy);
                inertieAjustee(1,3) = inertieObjet(1,3) + masseObjet * (-dx * dz);

                inertieAjustee(2,1) = inertieObjet(2,1) + masseObjet * (-dy * dx);
                inertieAjustee(2,2) = inertieObjet(2,2) + masseObjet * (dx^2 + dz^2);
                inertieAjustee(2,3) = inertieObjet(2,3) + masseObjet * (-dy * dz);

                inertieAjustee(3,1) = inertieObjet(3,1) + masseObjet * (-dz * dx);
                inertieAjustee(3,2) = inertieObjet(3,2) + masseObjet * (-dz * dy);
                inertieAjustee(3,3) = inertieObjet(3,3) + masseObjet * (dx^2 + dy^2);
                
        end
        
        function [inertieTotale] = InertieSysteme( obj, angRot )
            inertieCalcul = [0, 0, 0 ;0, 0, 0;0, 0, 0];
            
            for i = 1:numel(obj)
				%x = element numero 1, y = element numero 2, z = element numero 3;
				inertieCalcul = inertieCalcul + obj(i).Inertie;
			end %fin boucle for
            
            %Matrice de rotation
            RotX = [1, 0, 0; 0, cos(angRot), -sin(angRot); 0, sin(angRot), cos(angRot)];
            inertieTotale = RotX * transpose(inertieCalcul);
        end
        
    end
end