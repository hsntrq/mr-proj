function [thetac] = TurnLeft(xc,yc, thetac, connection, parameters)
     % Facing -ve X-axis 
    if (3.141 < thetac && thetac < 3.142)
        TurnController(xc,yc,-pi/2, connection, parameters);
        thetac = -pi/2;
    % Facing +ve Y-axis
    elseif (1.5707 < thetac && thetac < 1.5708)
        TurnController(xc,yc,pi, connection, parameters);
        thetac = pi;
    % Facing -ve Y-axis
    elseif (-1.5709 < thetac && thetac < -1.5707)
        TurnController(xc,yc,0, connection, parameters);
        thetac = 0;
    % Facing +ve X-axis 
    elseif (-0.001 < thetac && thetac < 0.001)
        TurnController(xc,yc,pi/2, connection, parameters);
        thetac = pi/2;
    end