function W = gen_DFTmatrix()

global B NI

M = B;
N = NI;
W = zeros(M, N);
for m = 1: M
    for n = 1: N
        W(m, n) = exp(-1j*2*pi*(m-1)*(n-1)/N);
    end
end