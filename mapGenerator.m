function cuboid = mapGenerator(room_size,ncells,wall_height,wall_thickness,opts)
arguments
    room_size = 10
    ncells = 4
    wall_height = 0.8
    wall_thickness = 0.15
    opts.plotMap = true
end

%% Generate Maze
lines = maze(ncells,ncells,[1 1],ncells*[1 1],false,false);

idx = all(isnan(lines),2);

idy = 1+cumsum(idx);
idz = 1:size(lines,1);
sep_lines = accumarray(idy(~idx),idz(~idx),[],@(r){lines(r,:)});

%% Get cuboids properties
for i=1:numel(sep_lines)
    base = room_size*sep_lines{i};
    xy = wall_thickness/2*(~diff(base));
    vert = [sortrows(base-xy,'ascend');...
            sortrows(base+xy,'descend')];
    
    cuboid{i}.dims = [max(diff(vert)),wall_height];
    
    rect = polyshape(vert(:,1),vert(:,2));
    [xc,yc] = centroid(rect);

    cuboid{i}.center = [xc,yc,wall_height/2];
    cuboid{i}.view2D = rect;
end

%% Plot 2d view of scene
if opts.plotMap
    figure, axis, hold; axis square
    for i=1:numel(sep_lines)
        plot(cuboid{i}.view2D,FaceColor='k');
    end
    hold off;
end

