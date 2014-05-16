%% Create 3d from Pattern
% This function creates a 3d test checkerboard structure 
% to validate the spatial statistics code
function create3dMatrix(filename,tag)

    %% Create base
    Base2D = im2bw(imread(filename));
    start = 1; jump = 10;  n = 10;

    %% Prepare 3d complementary stacks
    Stack3d(:,:,1:jump)=repmat(Base2D,[1,1,jump]);
    Stack3dCompliment = 1-Stack3d;

    %% Pile the 3d Stack and Complementary 3D Stack Alternately
    for iz = 1:n
        if mod(iz,2)==0
            Final3D(:,:,start:start+jump-1) = Stack3d;
        else
            Final3D(:,:,start:start+jump-1) = Stack3dCompliment;
        end
        start = start + jump;
    end
    clear Base2D Stack3d Stack3dCompliment

    %% Plot isocaps of 3D stack
    myisocaps(Final3D);
    %myisosurface(Concentric3D);

    eval(strcat('save ', tag, '.mat'));
    
end
