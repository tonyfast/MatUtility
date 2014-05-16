%% Create 3d concentric cylinders
% This script creates a 3d test concentric cylinder structure 
% to validate the spatial statistics code
clc; clear;
A2d = im2bw(imread('input/concentric.jpg'));
start = 1; jump = 10;  n = 10;

%% Prepare 3d complementary stacks
A3d(:,:,1:jump)=repmat(A2d,[1,1,jump]);
A3dc = 1-A3d;

% construct 3d set of concentric cylinders by attaching complementary stacks
for iz = 1:n
    if mod(iz,2)==0
        Concentric3D(:,:,start:start+jump-1) = A3d;
    else
        Concentric3D(:,:,start:start+jump-1) = A3dc;
    end
    start = start + jump;
end
clear A A3d A3dc

%% Plot results

% Plot isocaps
myisocaps(Concentric3D);
snapnow

% Plot isosurface
myisosurface(Concentric3D);
snapnow

% Plot slices
h = slice(Concentric3D,[-1 -.75 -.5],[],[]);
alpha('color')
set(h,'EdgeColor','none','FaceColor','interp','FaceAlpha','interp')
snapnow

save concentric3d.mat

