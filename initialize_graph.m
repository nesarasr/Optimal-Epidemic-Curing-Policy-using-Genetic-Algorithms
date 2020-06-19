function [G,C] = initialize_graph(size)
    rng(1);
    A = rand(size);
    B = transpose(A);
    C = (A+B)/2 ;
    C = C- diag(diag(C));
    G = graph(C);
end
