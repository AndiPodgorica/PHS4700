function momentId = Translation_I( momentIc, masse, posObj)
    x = posObj(1);
    y = posObj(2);
    z = posObj(3);
    
    Tdc = [ (y^2 + z^2)	(-x * y)	(-x * z) ;
            (-y * x)	(x^2 + z^2) (-y * z) ;
            (-z * x)    (-z * y)    (x^2 + y^2)];
    momentId = momentIc + masse * Tdc;
end