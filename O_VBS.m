% Choose parameters
Lx = 16;
J3 = 4;
J6 = 2;
Alpha = 0.6;
sx=[0,1;1,0]; % Pauli X matrix

N = Lx;

h = Ham_XXZ_J3J6(Lx, Alpha, J3, J6);
opts.p = 60;
[v, d] = eigs(h, 2, 'smallestreal', opts);

ground_state = v(:,1);

% calculating VBS order parameter
order_params = zeros(N, 1);
r_values = zeros(N,1);
% defining i = 2 as the central site
central_term = kronSpin(N, 2, sx, 3, sx) - kronSpin(N, 1, sx, 2, sx);

for i = 1:N
    if i == 1
        order_params(i) = ground_state.' * central_term * (kronSpin(N, i, sx, i+1, sx)-kronSpin(N, i, sx, N, sx)) *ground_state;
    elseif i == N
        order_params(i) = ground_state.' * central_term * (kronSpin(N, 1, sx, N, sx)-kronSpin(N, i-1, sx, i, sx)) *ground_state;
    end
    % If not near the beginning or end of the chain, no need for special cases 
    if i > 1 && i < N
        order_params(i) = ground_state.' * central_term * (kronSpin(N, i, sx, i+1, sx)-kronSpin(N, i-1, sx, i, sx)) *ground_state;
    end
    r_values(i) = i;
end

figure
plot(r_values, order_params)
title(sprintf('VBS order parameter vs r for J3 = %s, J6 = %s, Alpha = %s', num2str(J3), num2str(J6), num2str(Alpha)))
xlabel('Site value (i = 2 as center)') 
ylabel('C_z value') 


% order_params = reshape(order_params, Lx, Ly);
% image(order_params, 'CDataMapping', 'scaled')
% colorbar
% saveas(gcf, "C:/Users/Kristina/Desktop/QML/Ham_ED/imgXXY.jpg")
disp("Done")