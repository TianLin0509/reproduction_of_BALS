function [N1, N2] = gen_noise(SNR)

global B Nr Nt

N1 = zeros(B*Nr, Nt);
N2 = zeros(B*Nt, Nr);

for i = 1:B
    n = sqrt(1/2 / SNR) * (randn(Nr, Nt) + 1j* randn(Nr, Nt));
    N1((i-1)*Nr+1:i*Nr,:) = n;
    N2((i-1)*Nt+1:i*Nt,:) = n.';
end