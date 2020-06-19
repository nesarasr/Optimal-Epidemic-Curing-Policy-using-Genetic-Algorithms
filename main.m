ObjectiveFunction = @fitness;
nvars = 51;    % Number of variables
LB = zeros([1,51]);   % Lower bound
UB = ones([1,51]);  % Upper bound
ConstraintFunction = @constraint;
%PARETO-SEARCH 
%opts = optimoptions('paretosearch','UseVectorized',false,'ParetoSetSize',1000,'PlotFcn',{'psplotparetof' 'psplotparetox'},'Display','iter');
%[xga,fvalga] = paretosearch(ObjectiveFunction,nvars,[],[],[],[],LB,UB,ConstraintFunction,opts);
%[xval,fvalp] = gamultiobj(ObjectiveFunction,nvars,[],[],[],[],LB,UB,ConstraintFunction,opts);

%GA MULTI OBJ
%options = optimoptions(@gamultiobj,'PlotFcn',{@gaplotpareto,@gaplotscorediversity});
%options.FunctionTolerance=0.000001;
%[x,fval,~,gaoutput] =gamultiobj(ObjectiveFunction,nvars,[],[],[],[],LB,UB,ConstraintFunction,options);

%Pareto after ga
%optsp.InitialPoints = xgash;
%[xpsh3,fvalpsh3,~,pshoutput3] = paretosearch(fun,nvars,[],[],[],[],lb,ub,[],optsp);

%'PlotFcn',{@gaplotbestf,@gaplotscorediversity}
%GA SINGLE OBJECTIVE
opts = optimoptions(@ga,'PlotFcn',{@gaplotbestf,@gaplotscorediversity},'SelectionFcn','selectionroulette','Display','iter');
%opts.MaxGenerations=100;
%opts.FunctionTolerance=0.000001;
[x,fval] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB,ConstraintFunction,opts);
