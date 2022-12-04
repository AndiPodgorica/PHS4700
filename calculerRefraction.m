function [ut,reflectionInterne]=calculerRefraction(pointImpact,Robs,nint,next)
reflectionInterne=false;
i=pointImpact/norm(pointImpact);
ui=pointImpact-Robs/norm(pointImpact-Robs);
j=cross(ui,i)/norm(cross(ui,i));
k=cross(i,j);
st=(nint/next)*dot(ui,k);
ut=-i*sqrt(1-st^2)+st*k;

thetaT=asin(st);

if thetaT>asin(nint/next)
    reflectionInterne=true;
    ut=calculerReflexion(ui,i,k);
end
    
end