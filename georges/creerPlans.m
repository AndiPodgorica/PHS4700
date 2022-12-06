function plans=creerPlans()
plan1=creerPlan(1,[-1;0;0],2,[-2;-1;0],[-2;1;4]);
plan2=creerPlan(2,[1;0;0],2,[2;-1;0],[2;1;4]);
plan3=creerPlan(3,[0;-1;0],1,[-2;-1;0],[2;-1;4]);
plan4=creerPlan(4,[0;1;0],1,[-2;1;0],[2;1;4]);
plan5=creerPlan(5,[0;0;-1],0,[-2;1;0],[2;1;0]);
plan6=creerPlan(6,[0;0;1],4,[-2;-1;4],[2;1;4]);

plans={plan1,plan2,plan3,plan4,plan5,plan6};
end
