close all
clear
clc

%%
n = 10;
scene_name = "scenes/scene";
extension = ".ttt";

for i=1:n
    walls = mapGenerator(plotMap=false);
    addWallsToScene(scene_name + i + extension,walls);
end

%%