function addWallsToScene(scene_name,cuboid)
%% Add walls to coppelia scene

client = RemoteAPIClient();
sim = client.getObject('sim');
origin = sim.getObject('/Origin');

for i = 1:numel(cuboid)
    dims = cuboid{i}.dims;
    center = cuboid{i}.center;

    walls(i) = sim.createPrimitiveShape(sim.primitiveshape_cuboid,dims);
    sim.setObjectPosition(walls(i),origin,center);
end

%% Save scene and reset base scene
buffer = sim.saveScene();
sim.removeObjects(walls);

fileID = fopen(scene_name,'w');
fwrite(fileID,buffer);
fclose(fileID);
