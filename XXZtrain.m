% Choose parameters
Lx = 16;
J3 = 1;
J6 = 10;
Alpha = 0.6; % zAFM phase point

N = Lx;
ops.p = 100; % large number of basis vectors for eigensolver

h = Ham_XXZ_J3J6(Lx, Alpha, J3, J6);
[v, d] = eigs(h, 6, 'smallestreal', ops);

gs = v(:,1);
save('zAFMtrain.mat', "gs", '-v7')