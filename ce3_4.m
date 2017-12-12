clear all
close all
clc

laserbeamdata = load('laserbeamdataN.mat');

y = laserbeamdata.y;
u = laserbeamdata.u;
Te = 1e-3; % sampling time

%%
N = length(y);
r = 10; %au bol

Y = [];
U = [];

for k=1:N-r
    Y = [Y, y(k:k+r)];
    U = [U, u(k:k+r)];
end


%% U orthogonal
U_orth = eye(N-r,N-r) - U'*pinv(U*U')*U;

Q = Y*U_orth;

n = svd(Q)

Q_est = Q(:,1:n);

C = Q_est(1,:)