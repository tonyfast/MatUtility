%% Create 2d checkerwave
% This script creates a 3d test checker wave structure to validate the spatial
% statistics code
clc; clear;
A2d = im2bw(imread('wavybase.jpg'));
start = 1; jump = 64;  n = 4;

%% Prepare 3d complementary stacks
A3d(:,:,1:jump)=repmat(A2d,[1,1,jump]);
A3dc = 1-A3d;

% construct 3d set of checkerwaves by attaching complementary stacks
for iz = 1:n
    if mod(iz,2)==0
        Checkwave3D(:,:,start:start+jump-1) = A3d;
    else
        Checkwave3D(:,:,start:start+jump-1) = A3dc;
    end
    start = start + jump;
end
clear A A3d A3dc

% Plot isocaps
myisocaps(Checkwave3D);
%myisosurface(Checkwave3D);

save checkerwave3d.mat

