function precision=calculerDeltaT(dt,vx,vy,vz,x,y,z)
vitesse=[vx,vy,vz];
    while true
        distance1=sqrt(x*x+y*y+z*z)+norm(vitesse)*dt;
        distance2=sqrt(x*x+y*y+z*z)+norm(vitesse)*dt/2;
        if (distance1-distance2)<=10
            precision=dt;
            break;
        else
            dt=dt/2;
        end
    end
end