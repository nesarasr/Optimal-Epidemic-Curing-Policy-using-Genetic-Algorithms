function xchildren = crossover(parents, options, nvars, FitnessFcn,unused,thisPopulation)
    
    nKids = length(parents)/2;

    xchildren = zeros(nKids,nvars);
    index = 1;

    for i=1:nKids
    
        p1 = thisPopulation(parents(index),:);
        index = index + 1;
        p2 = thisPopulation(parents(index),:);
        index = index + 1;
        %crossover_fraction=0.9;
        EPS=exp(-14);
        eta_c=1;
        y1=zeros(1,nvars);
        y2=zeros(1,nvars);
        prob=1;
        if prob == 1
            for i=1:nvars
                if rand()<=0.5
                    if p1(i)<p2(i)
                        y1(i)=p1(i);
                        y2(i)=p2(i);
                    else    
                        y1(i)=p2(i);
                        y2(i)=p1(i);
                    end
                    if abs(p1(i)-p2(i))>EPS
                        ylow=0;
                        yupp=1;
                        u=rand();
                        mini = min((y1(i)-ylow),(yupp-y2(i)))
                        beta=1.0+(2.0*mini/(y2(i)-y1(i)));
                        alpha=2.0-(beta^(eta_c+1.0));
                        if(u<=(1.0/alpha))
                            betaq=(u*alpha)^(1.0/(eta_c+1.0));
                        else
                            betaq=(1.0/(2.0-u*alpha))^(1.0/(eta_c+1.0));
                        end
                            
                        y1(i)=0.5*((y1(i)+y2(i))-betaq*(y2(i)-y1(i)));
                        y2(i)=0.5*((y1(i)+y2(i))+betaq*(y2(i)-y1(i)));   
                    else
                        y1(i)=p1(i);
                        y2(i)=p2(i);
                    end
                else
                    y1(i)=p1(i);
                    y2(i)=p2(i);
                end
            end        
        else
            y1=p1;
            y2=p2;
        end
        if FitnessFcn(y1)>FitnessFcn(y2)
            xchildren(i,:)=y2;
        else
            xchildren(i,:)=y1;
        end   
    end    
   
end