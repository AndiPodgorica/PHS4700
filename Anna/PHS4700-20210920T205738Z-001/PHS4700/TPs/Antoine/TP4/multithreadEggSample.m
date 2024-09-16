[obs, blocTrans, blocColors] = Declarations([-10 -10  15], 1, 1.5);
funList = {@Calculs.Collision,@Calculs.Collision,@Calculs.Collision};
d = Droite([2 0 0]', [-10 3.5 14]');
d2 = Droite([2 2 0]', [-10 3.5 14]');
d3 = Droite([2 0 5]', [-10 3.5 14]');
dataList = {d,d2,d3,d}; %# or pass file names 
plans = {blocTrans.Plans(1), blocTrans.Plans(2), blocTrans.Plans(3), blocTrans.Plans(3)};

parpool local 

parfor i=1:length(funList)
    %# call the function
    d = dataList{i};
    p = plans{i};
    funList{i}(d, p)
end

delete(gcp('nocreate'))
