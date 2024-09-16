function [isCollision, collisionNormal, coinCollison] = CheckCol(rfa, rfb)
    isCollision = [0;0];
    coinCollison = [0;0];
    collisionNormal =[0;0];
    
    La = 4.78;
    Lb = 4.23;
    la = 1.82;
    lb = 1.6;
    
    rc_a = [rfa(1) rfa(2)];
    rc_b = [rfb(1) rfb(2)];
  
    r_a_min = sqrt(La^2 + la^2 )/2; % Composante en z pas importante
    r_b_min = sqrt(Lb^2 + lb^2)/2;
    
    if(abs(rc_a - rc_b) > r_a_min + r_b_min) % Certain pas de collision
        isCollision(1,1) = 0;
        
    else
        q1_a = [-La/2; -la/2];
        q2_a = [La/2; -la/2];
        q3_a = [La/2; la/2];
        q4_a = [-La/2; la/2];
        
        matriceRotationA = [cos(rfa(3)) -sin(rfa(3)); sin(rfa(3)) cos(rfa(3))];
        q1_a = [rfa(1); rfa(2)] + matriceRotationA*q1_a;
        q2_a = [rfa(1); rfa(2)] + matriceRotationA*q2_a;
        q3_a = [rfa(1); rfa(2)] + matriceRotationA*q3_a;
        q4_a = [rfa(1); rfa(2)] + matriceRotationA*q4_a;
        
        q1_b = [-Lb/2; -lb/2];
        q2_b = [Lb/2; -lb/2];
        q3_b = [Lb/2 ; lb/2];
        q4_b = [-Lb/2; lb/2];
        matriceRotationB = [cos(rfb(3)) -sin(rfb(3)); sin(rfb(3)) cos(rfb(3))];
        q1_b = [rfb(1); rfb(2)] + matriceRotationB*q1_b;
        q2_b = [rfb(1); rfb(2)] + matriceRotationB*q2_b;
        q3_b = [rfb(1); rfb(2)] + matriceRotationB*q3_b;
        q4_b = [rfb(1); rfb(2)] + matriceRotationB*q4_b;
        
        q_a = [q1_a q2_a q3_a q4_a];
        q_b = [q1_b q2_b q3_b q4_b];
        
        for i=1:4
            fn = mod(i, 4) + 1;
            pa = q_a(:,i) - q_a(:, fn);
          
            n = Normale(q_a(:,i), q_a(:, fn));
            
            allNeg = 1;
        
            %for j=1:4
                for j=1:4
                    dij = dot(n, (q_b(:,j) - pa));
                    if(dij > 0)
                        allNeg = 0;
                        break;
                    end
                end
           % end
        end

        if(allNeg==1)
            for i=1:4
                allNull = 1;
                fn = mod(i, 4) + 1;
                pa = q_a(:,i) - q_a(:, fn);
                n = Normale(q_a(:,i), q_a(:, fn));
                for j=1:4
                    dij = dot(n, (q_b(:,j) - pa));
                    if(dij ~= 0)
                        allNull = 0;
                    end
                    
                end
                if (allNull == 1)
                    isCollision(1,1) = 1; 
                    collisionNormal = n;
                    break;
                 end
            end
            

            %end
        end
        for i=1:4
            fn = mod(i, 4) + 1;
            pb = q_b(:,i) - q_b(:, fn);
          
            n = Normale(q_b(:,i), q_b(:, fn));
            
            allNeg = 1;
        
            %for j=1:4
                for j=1:4
                    dij = dot(n, (q_a(:,j) - pb));
                    if(dij > 0)
                        allNeg = 0;
                        break;
                    end
                end
           % end
        end

        if(allNeg==1)
            for i=1:4
                allNull = 1;
                fn = mod(i, 4) + 1;
                pb = q_b(:,i) - q_b(:, fn);
                n = Normale(q_b(:,i), q_b(:, fn));
                for j=1:4
                    dij = dot(n, (q_a(:,j) - pb));
                    if(dij ~= 0)
                        allNull = 0;
                    end
                    
                end
                if (allNull == 1)
                    isCollision(1,1) = 1; 
                    collisionNormal = n;
                    break;
                 end
            end
            

            %end
        end
        
        
    end
    
    
end
function normal = Normale(c1, c2)
    c1u = [c1/norm(c1); 0];
    c2u = [c2/norm(c2); 0];
    c3u = [0; 0; 1]; 
    n = [c1(1); -1*c1(2)]/norm(c1);
    c1crossc2 = cross(c1u,c2u);
    c2crossc3 = cross(c2u,c3u);
    c3crossc1 = cross(c3u,c1u);
    if(c1crossc2(1)~= c3u(1) ||c1crossc2(2)~= c3u(2)||c1crossc2(3)~= c3u(3)|| c2crossc3(1)~= c1u(1) ||c2crossc3(2)~= c1u(2)||c2crossc3(3)~= c1u(3)) ||c3crossc1(1)~= c2u(1) ||c3crossc1(2)~= c2u(2)||c3crossc1(3)~= c2u(3)
        n = -1*n; %z=-1;
    end
    normal = n;

end