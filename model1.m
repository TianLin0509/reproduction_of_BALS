function Y = model1(X, m)

Y = [];
for i = 1 : size(X, 3) 
    if m == 1
        tmp = squeeze(X(:,:, i));
    else 
        tmp =  squeeze(X(:,:, i)).';
    end
    Y = [Y, tmp];
end

