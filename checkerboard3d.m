%% Create 3d checkerboard
% This script creates a 3d test checkerboard structure 
% to validate the spatial statistics code
clc; clear;
A2d = checkerboard(5)<0.5;

%% Set Inputs
start = 1; jump = 5;  n = 8;

%% Prepare 3d complementary stacks
A3d(:,:,1:jump)=repmat(A2d,[1,1,jump]);
A3dc = 1-A3d;

%% Construct 3d set of checkerboards by attaching complementary stacks
for iz = 1:n
    if mod(iz,2)==0
        Check3D(:,:,start:start+jump-1) = A3d;
    else
        Check3D(:,:,start:start+jump-1) = A3dc;
    end
    start = start + jump;
end
clear A A3d A3dc

% Plot isocaps
myisocaps(Check3D);
%myisosurface(Check3D);

save checkerboard3d.mat
