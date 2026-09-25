% Givna konstanter
r = 0.3;
K = 108;
R_m = 0.7;
alpha = 5.7;
Z = 5;

f = @(P) r.*P.*(1 - P./K) - R_m.*Z.*(P.^2)/(alpha.^2 + P.^2); 

% Plotting fixpoint_iter
x = linspace(0, 100, 100000);
plot(x, f(x));

% startgissning = 13 (1)
start_guess = 90;
% startgissning = 95 (2)
% start_guess = 95;

fixpoint_iter = @(P) P + 2.*r.*P.*(1 - (P/K)) - 2.*R_m.*Z.*(P.^2)./(alpha.^2 + P.^2); 
tol = 1e-10;
diff = 1;
curr_iter = fixpoint_iter(start_guess);
fprintf("startgissning: %d\n", start_guess)

while diff > tol
    next_iter = fixpoint_iter(curr_iter);
    diff = abs(next_iter - curr_iter);
    fprintf('%.16e\n', next_iter);
    curr_iter = next_iter;
end

