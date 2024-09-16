function termine=doitTerminer(x,y,z)

if x*x+y*y+z*z >= 1e14
    termine=true;

elseif x*x+y*y+z*z <= 6.371e6*6.371e6
    termine=true;
else
    termine=false;
end