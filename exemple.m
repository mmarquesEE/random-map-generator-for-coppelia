close all
clear
clc

%% Instructions
% First, make sure that the base scene is open on coppelia. This scene
% contains a 10x10m floor and the origin reference, used by addWallsToScene
% to correctly place the walls. The 10x10 area is the default area
% considered by the mapGenerator function. If bigger or smaller areas are
% needed, add the floor and then add the "Origin" named dummy to the scene
% positioned add the bottom left vertice of the new floor.

%% Creating an exemple
% Name of the scene to be saved
scene_name = "exemple.ttt";

% Get walls
% 
% A square area map is generated. Only square areas can be
% produced.

% Optional parameters:
% room_size: length of the square side (default: 10m)
% ncells: number of cells per square side (default: 4)
% wall_height: height of the generated walls (default: 0.8m)
% wall_thickness: thickness of the walls (default: 0.15m)
% options.plotMap: plot generated map or not (defualt: true)
walls = mapGenerator();

% Add walls to scene
addWallsToScene(scene_name,walls);