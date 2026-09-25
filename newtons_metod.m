% Givna konstanter
r = 0.3;
K = 108;
R_m = 0.7;
alpha = 5.7;
Z = 5;

f = @(P) r.*P.*(1 - P./K) - R_m.*Z.*(P.^2)/(alpha.^2 + P.^2); 
dfdp = @(P) r .* (1 - 2.*P./K) - (2 .* R_m .* Z .* alpha.^2 .* P) ./ (alpha.^2 + P.^2).^2;
x = linspace(5, 100, 100000);
plot(x, f(x));

start_guess = 10;
tol = 1e-10;
diff = 1;

curr_iter = start_guess - (f(start_guess)./dfdp(start_guess));
fprintf("startgissning: %d\n", start_guess)
fprintf('%.16f\n',curr_iter)

while diff > tol
    next_iter = curr_iter - (f(curr_iter)./dfdp(curr_iter));
    diff = abs(curr_iter - next_iter);
    fprintf('%.16e\n', next_iter);
    curr_iter = next_iter;
end

