function [isCollision, collisionVector] = Collision(angleA, angleB, rotatedPosA, rotatedPosB, cm_a, cm_b)
    
    % source is car A and incoming is car B
    [isCollision, collisionVector] = Detect(rotatedPosA, rotatedPosB, 1, cm_a, cm_b);
    
    if(isCollision <= 0)
        % source is car B and incoming is car A
        [isCollision, collisionVector] = Detect(rotatedPosB, rotatedPosA, 2, cm_a, cm_b);
    end
end