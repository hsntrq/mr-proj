%% Kinematic Control
% Tests the implemented control algorithm within a CoppeliaSim simulation.

% In order to run the simulation:
%   - Start CoppeliaSim
%   - Load the scene scene/mooc_exercise.ttt
%   - Hit the run button
%   - Start this script


% [PFr, PBr, PRr, PLr]

%% Parameters setup

%% Define stopping conditions
parameters.dist_threshold= 0.03; % threshold distance to goal
parameters.angle_threshold = 0.03; % threshold orientation to goal
 
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

% Get input from wheel encoders and proximity sensors

firstrun = 1;

% Get Current Pose of Robot
[x, y, theta] = bob_getPose(connection);

if firstrun
    firsrun = 0;
    xc = x ;
    yc = y;
    thetac = theta;
end

% Implement the determined sequence for square motion in terms of the 
% poseController function with appropriate arguments. 

% Send desired pose to controller
% poseController(xg, yg, thetag, connection, parameters)

% Your code goes here.
% [PFr, PBr, PRr, PLr]

% lProximity = LocalProximity(connection);
% gProximity = GlobalProximity(connection, thetac);
% 
% [xc,yc,thetac] = GoXpositive(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoXnegative(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoXnegative(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoXnegative(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoXnegative(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoYpositive(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoXpositive(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoXpositive(xc,yc,thetac,connection,parameters)
% [xc,yc,thetac] = GoXpositive(xc,yc,thetac,connection,parameters)

[map, path] = random_mouse(6,6, [1,6],[6,1], xc,yc,thetac,connection,parameters);


lProximity = LocalProximity(connection);
gProximity = GlobalProximity(connection, thetac);

% 
% [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
% [thetac] = TurnLeft(xc, yc, thetac, connection, parameters);
% [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
% [thetac] = TurnLeft(xc, yc, thetac, connection, parameters);
% [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
% [thetac] = TurnLeft(xc, yc, thetac, connection, parameters);
% [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
% [thetac] = TurnLeft(xc, yc, thetac, connection, parameters);



%% Bring Bob to standstill
bob_setWheelSpeeds(connection, 0.0, 0.0);
firstrun = 1;

simulation_stop(connection);
simulation_closeConnection(connection);

% msgbox('Simulation ended');
