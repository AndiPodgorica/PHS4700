function [isCollision, collisionNormal, coinCollison] = CheckCollision(rfa, rfb, t)
    isCollision = [0;0];
    coinCollison = [0;0];
    collisionNormal =[0;0];
    
    La = 4.78;
    Lb = 4.23;
    la = 1.82;
    lb = 1.6;
    
    rc_a = [rfa(1) rfa(2)];
    rc_b = [rfb(1) rfb(2)];
  
    r_a_min = sqrt(4.78^2 + 1.82^2 )/2; % Composante en z pas importante
    r_b_min = sqrt(4.23^2 + 1.6^2)/2;
    
    if(abs(rc_a - rc_b) > r_a_min + r_b_min) % Certain pas de collision
        isCollision(1,1) = 0;
    else
        p1_a = [-La/2; -la/2];
        p2_a = [-La/2; la/2];
        p3_a = [La/2; la/2];
        p4_a = [La/2; -la/2];

        p1_b = [-Lb/2; -lb/2];
        p2_b = [-Lb/2; lb/2];
        p3_b = [Lb/2; lb/2];
        p4_b = [Lb/2; -lb/2];

        n1_a = [-1; 0];
        n2_a = [0; 1];
        n3_a = [1; 0];
        n4_a = [0;-1];
    

        n1_b = [-1; 0];
        n2_b = [0; 1];
        n3_b = [1; 0];
        n4_b = [0;-1];

        matriceRotationA = [cos(rfa(3)) -sin(rfa(3)); sin(rfa(3)) cos(rfa(3))];
        matriceRotationB = [cos(rfb(3)) -sin(rfb(3)); sin(rfb(3)) cos(rfb(3))];

        
        p1_a = [rfa(1); rfa(2)] + matriceRotationA*p1_a;
        p2_a = [rfa(1); rfa(2)] + matriceRotationA*p2_a;
        p3_a = [rfa(1); rfa(2)] + matriceRotationA*p3_a;
        p4_a = [rfa(1); rfa(2)] + matriceRotationA*p4_a;

        p1_b = [rfb(1); rfb(2)] + matriceRotationB*p1_b;
        p2_b = [rfb(1); rfb(2)] + matriceRotationB*p2_b;
        p3_b = [rfb(1); rfb(2)] + matriceRotationB*p3_b;
        p4_b = [rfb(1); rfb(2)] + matriceRotationB*p4_b;
           
       
        n1_a = matriceRotationA*n1_a; 
        n2_a = matriceRotationA*n2_a; 
        n3_a = matriceRotationA*n3_a; 
        n4_a = matriceRotationA*n4_a; 

        n1_b = matriceRotationB*n1_b; 
        n2_b = matriceRotationB*n2_b; 
        n3_b = matriceRotationB*n3_b; 
        n4_b = matriceRotationB*n4_b; 
        
   

        pa = [p1_a p2_a p3_a p4_a];
        pb = [p1_b p2_b p3_b p4_b];

        na = [n1_a n2_a n3_a n4_a];
        nb = [n1_b n2_b n3_b n4_b];
        allPos = 1;
        for i=1:4
            for j=1:4
                d_j_i = dot((pb(:,j) - pa(:, i)), na(:, i));
                if(d_j_i <= 0)
                    allPos = 0;
                end
            end
            if(allPos==1)
                break;
            end
        end
        
        allNeg = 1;
        if(allPos==0)
            for j=1:4
                for i=1:4
                    d_j_i = dot((pb(:,j) - pa(:, i)), na(:, i));
                    if(d_j_i > 0)
                        allNeg = 0;
                        break;
                    end
                end
                if(allNeg==1)
                    isCollision(1,1) = 1;
                    collisionNormal = -na(:, i);
                    coinCollison = pb(:, j);
                    break;
                end
            end

        end
        allPos = 1;
        if(isCollision(1,1)==0)
            for j=1:4
                for i=1:4
                    d_i_j = dot((pa(:,i) - pb(:, j)), nb(:, j));
                    if(d_i_j <= 0)
                        allPos = 0;
                    end
                end
                if(allPos==1)
                    break;
                end
            end
        end
        allNeg =1;
        if(allPos==0)
            for i=1:4
                for j=1:4
                    d_i_j = dot((pa(:,i) - pb(:, j)), nb(:, j));
                    if(d_i_j > 0)
                        allNeg = 0;
                        break;
                    end
                end
                if(allNeg==1)
                    isCollision(1,1) = 1;
                    collisionNormal = nb(:, j);
                    coinCollison = pa(:, i);
                    break;
                end
                
            end
        end
    end
  

end

    
    


