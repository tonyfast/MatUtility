%% This function plots isocaps of 3d matrix 
function myisocaps(data3d)

    %% Prepare the data
    %data = rand(12,12,12);
    %n=200; start=100; 
    %endindex=start+n-1;
    %data = dataphi(start:endindex,start:endindex,start:endindex);
    data3d = smooth3(data3d,'box',5);


    %% Create Isosurface and set properties
    isoval = .5;
    h = patch(isosurface(data3d,isoval),...
    'FaceColor','blue',...
    'EdgeColor','none',...
    'AmbientStrength',.2,...
    'SpecularStrength',.7,...
    'DiffuseStrength',.4);
    isonormals(data3d,h)

    %% Create Isocaps and set properties
    patch(isocaps(data3d,isoval),...
    'FaceColor','interp',...
    'EdgeColor','none')
    colormap hsv

    %% Set the view
    daspect([1,1,1])
    axis tight
    view(3)

    %% Add lighting and rendering
    camlight right
    camlight left
    set(gcf,'Renderer','zbuffer');
    lighting phong
    axis off
    
    %% Save image to disk
    print -djpeg -r96 test.jpeg

end