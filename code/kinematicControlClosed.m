%% Kinematic Control
% Tests the implemented control algorithm within a CoppeliaSim simulation.

% In order to run the simulation:
%   - Start CoppeliaSim
%   - Load the scene scene/mooc_exercise.ttt
%   - Hit the run button
%   - Start this script

%% Parameters setup

%% Define stopping conditions
parameters.dist_threshold= 0.03; % threshold distance to goal
parameters.angle_threshold = 0.005; % threshold orientation to goal
 
%% Initialize connection with V-Rep
startup;
connection = simulation_setup();
connection = simulation_openConnection(connection, 0);
simulation_start(connection);

%% Get static data from V-Rep
bob_init(connection);

parameters.wheelDiameter = bob_getWheelDiameter(connection);
parameters.wheelRadius = parameters.wheelDiameter/2.0;
parameters.interWheelDistance = bob_getInterWheelDistance(connection);
parameters.scannerPoseWrtBob = bob_getScannerPose(connection);

%% CONTROL LOOP.

[x, y, theta] = bob_getPose(connection);

% Implement the determined sequence for square motion in terms of the 
% poseController function with appropriate arguments. 

% Your code goes here. 

xi = 0;
yi = -2;

% Write your command sequence here as a 3xN array where N is the number of
% commands in the sequence. 
% commandSequence = [0, 0, 0.5, 0.5, 0; 0, 0.5, 0.5, 0, 0; pi/2, pi/2, 0, -pi/2, pi]; %Fill this array]

% Execute the command sequence
% poseController(xg, yg, thetag, connection, parameters)

% Test straight
% Go straight
poseController(0+xi,0.5+yi,pi/2, connection, parameters);
% Turn right
poseController(0+xi,0.5+yi,0, connection, parameters);
% % Go straight
poseController(0.5+xi,0.5+yi,0, connection, parameters);
% % Turn right
poseController(0.5+xi,0.5+yi,-pi/2, connection, parameters);
% % Go straight
poseController(0.5+xi,0+yi,-pi/2, connection, parameters);
% % Turn right
poseController(0.5+xi,0+yi,-pi, connection, parameters);
% % Go straight
poseController(0+xi,0+yi, 180, connection, parameters);

%% Bring Bob to standstill
bob_setWheelSpeeds(connection, 0.0, 0.0);

simulation_stop(connection);
simulation_closeConnection(connection);

% msgbox('Simulation ended');
