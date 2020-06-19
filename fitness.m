function f = fitness(x)
    s = size(x);
    nvars = s(2);
    rng(1);
    cost= randi([0 10],nvars,1);
    %single objective
    
    %multiobjective
    f1 = x*cost/(9.01-0.593);
    f2 = (-x(27)-x(28)-x(32)-x(35)-x(36)-x(44)-x(47)-x(49))/8;
    f = f1+f2;
end
