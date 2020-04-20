addpath('channel_generation', 'BLAS')
clear all;
global  Nr B Nt NI P

Nr = 9;
B = 25;
Nt = 16;
NI = 25;
P = 3; %paths
SNR_set = -15:3:15;
Nloop = 10;

for snr_idx = 1 : length(SNR_set)
    SNR = 10^(SNR_set(snr_idx)/10)
    mse = zeros(1, Nloop);
    for n = 1:Nloop
        n
        
        G = generate_channel_LOS(NI, Nr, P);
        H = generate_channel_LOS(Nt, NI, P);
        S = gen_DFTmatrix();
        Z = H.';
        Y = gen_tensor(G, Z, S);
        Y1 = model1(Y,1);
        Noise = (randn(Nr, Nt, B) + 1j * randn(Nr, Nt, B));
        Noise = Noise / sqrt(2 * SNR);
        Y = Y + Noise;
        [G_est, H_est, diff, e] = BLAS(S, eye(Nt), Y);
        Hc = G * H;
        Hc_est = G_est * H_est;
        mseG(n) = (norm(G - G_est, 'fro') / norm(G, 'fro'))^2;
        mseH(n) = (norm(H - H_est, 'fro') / norm(H, 'fro'))^2;
        mse(n) = (norm(Hc - Hc_est, 'fro') / norm(Hc, 'fro'))^2;
    end
    Mse(snr_idx) = mean(mse)
    MseG(snr_idx) = mean(mseG)
    
end
semilogy(SNR_set, Mse)




