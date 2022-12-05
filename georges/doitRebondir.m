function doitRebondir=doitRebondir(rayon,problem)
if rayon.nRebound<=problem.hyperParam.nRebondMax
    doitRebondir=true;
else
    doitRebondir=false;
end
end