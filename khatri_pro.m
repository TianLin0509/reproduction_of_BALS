function M = khatri_pro(A,B)

[a, K] = size(A);
[b, ~] = size(B);
M = zeros(a * b, K);
for k = 1 : K
   M(:, k) = kron(A(:,k), B(:,k));
end