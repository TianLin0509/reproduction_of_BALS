function H = generate_channel(Nt, Nr, L)

AOD = pi*rand(L, 2) - pi/2;  %-2/pi~2/pi
AOA = pi*rand(L, 2) - pi/2;  %-2/pi~2/pi
alpha = (randn(1,L)+1i*randn(1,L))/sqrt(2);
H = zeros(Nr, Nt);
for l=1:1:L
    ar = array_response(AOA(l,1),AOA(l,2), Nr);
    at = array_response(AOD(l,1),AOD(l,2), Nt);
    H = H + sqrt(Nr * Nt/L)*alpha(l)*ar*at';
end