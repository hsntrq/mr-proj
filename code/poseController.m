function poseController(xg, yg, thetag, connection, parameters)
% Pose controller for a wheeled robot
% (xg,yg): Desired goal position
% thetag: Desired orientation
% parameters: Contain stopping conditions

EndCond = 0;
while (~EndCond)    
    % Get Current pose from vrep
    [x, y, theta] = bob_getPose(connection);

    %[leftVelRadPerSec, rightVelRadPerSec, PFr, PBr, PRr, PLr] = bob_getWheelSpeeds(connection);

    % Printing proximity sensor readings to command window
    %ProximityData = [PFr, PBr, PRr, PLr]

    % Current Pose readings to command window
    %CurrentPose = [x, y, theta]
    
    % Computing control commands v and w
    % Write your code here
    
    % Controller Gain
    K1 = 0.7;
    K2 = 0.7;

    %Calculating Difference and Error angle
    D = sqrt((xg - x)^2 + (yg - y)^2) %* sign(cos(thetag))
    e = thetag - theta;
    % e = wrapToPi(e);

    % Pose Correction
    if (abs(D) < 0.02)
    w = K1 * atan2(sin(e),cos(e)); %* sign(cos(thetag));
    v= 0;

    % Straight-line motion
    else
    % w = K1 * atan2(sin(e),cos(e)) * sign(cos(thetag));
    w = 0;
    v = K2 * D;
    end
% Calculate wheel speeds
    [LeftWheelVelocity, RightWheelVelocity ] = calculateWheelSpeeds(v, w, parameters);

    % End condition
    dtheta = abs((thetag-theta));
    rho = sqrt((xg-x)^2+(yg-y)^2)  

    EndCond = (rho < parameters.dist_threshold && dtheta < parameters.angle_threshold);   
    
    % Set robot wheel speeds
    bob_setWheelSpeeds(connection, LeftWheelVelocity, RightWheelVelocity);
end

% Stopping Bob
bob_setWheelSpeeds(connection,0,0);