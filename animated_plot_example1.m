c = -pi:.04:pi;
cx = cos(c);
cy = -sin(c);
figure('color','white');
axis off, axis equal
line(cx, cy, 'color', [.4 .4 .8],'LineWidth',3);
title('See Pythagoras run!','Color',[.6 0 0])
hold on
x = [-1 0 1 -1];
y =   [0 0 0 0];
ht = area(x,y,'facecolor',[.6 0 0]);
for j = 1:length(c)
    x(2) = cx(j);
    y(2) = cy(j);
    set(ht,'XData',x)
    set(ht,'YData',y)
    drawnow
end