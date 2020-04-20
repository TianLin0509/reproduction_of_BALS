function Y = gen_tensor(G, Z, S)

[L, N] = size(G);
T = size(Z, 1);
K = size(S, 1);

Y = zeros(L, T, K);
for l = 1: L
    for t = 1: T
        for k = 1:K
            for n = 1 : N
                Y(l,t,k) = Y(l,t,k) + G(l,n) * Z(t,n) * S(k,n);
            end
        end
    end
end