function y = array_response(phi,theta, N)
for m= 0:sqrt(N)-1
    for n= 0:sqrt(N)-1
        y(m*(sqrt(N))+n+1) = exp( 1i* pi* ( m*sin(phi)*sin(theta) + n*cos(theta) ) );
    end
end
y = y.'/sqrt(N);
end