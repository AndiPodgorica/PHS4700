function distance=calculerDistanceD(Robs,u)
a=u(1)^2+u(2)^2+u(3)^2;
b=2*(Robs(1)*u(1)+Robs(2)*u(2)+Robs(3)*u(3));
c=Robs(1)^2+Robs(2)^2+Robs(3)^2;

det=b^2-4*a*c;
distance=1;
if det>0
    x1=(-b+sqrt(det))/2*a;
    x2=(-b-sqrt(det))/2*a;
    distance=x1;
    if x2<x1
        distance=x2;
    end
end
end