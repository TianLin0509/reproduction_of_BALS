function [G, H, def_e, e] = BLAS(S, X, Y)

Y1 = model1(Y, 1);
Y2 = model1(Y, 2);
N = size(S, 2);
M = size(X, 2);

i = 0;
H = randn(N, M) + 1j * randn(N, M);

def_e = 1;
old_e = 1;
while(def_e > 10^-2)
    tmp = khatri_pro(S, X * H.');
    G = Y1 * pinv(tmp.');
    tmp = khatri_pro(S, G);
    tmp = pinv(X) * Y2 * pinv(tmp.');
    H = tmp.';
    Z = X * H.';
    construct_Y = gen_tensor(G, Z, S);
    construct_Y1 = model1(construct_Y,1);
    e = norm(construct_Y1 - Y1, 'fro');
    def_e = abs(e - old_e);
    old_e = e;
end


