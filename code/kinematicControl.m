%% Kinematic Control
% Tests the implemented control algorithm within a CoppeliaSim simulation.

% In order to run the simulation:
%   - Start CoppeliaSim
%   - Load the scene scene/mooc_exercise.ttt
%   - Hit the run button
%   - Start this script
 
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

% Write your command sequence here as a 3xN array where N is the number of
% commands in the sequence. 
commandSequence = [1 0 1 0 1 0 1 0; 0 -pi/2 0 -pi/2 0 -pi/2 0 0; 1 1 1 1 1 1 1 1]; %Fill this array]

% Execute the command sequence
[LeftWheelVelocity, RightWheelVelocity ] = calculateWheelSpeeds(commandSequence(1,1), commandSequence(2,1), parameters);
bob_setWheelSpeeds(connection, LeftWheelVelocity, RightWheelVelocity);

for i = 2:size(commandSequence,2)
    [LeftWheelVelocity, RightWheelVelocity ] = calculateWheelSpeeds(commandSequence(1,i), commandSequence(2,i), parameters);
    pause(commandSequence(3,i-1));
    bob_setWheelSpeeds(connection, LeftWheelVelocity, RightWheelVelocity);
end

%% Bring Bob to standstill
bob_setWheelSpeeds(connection, 0.0, 0.0);

simulation_stop(connection);
simulation_closeConnection(connection);

% msgbox('Simulation ended');
