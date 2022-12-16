function [xc,yc,thetac] = GoXnegative(xc,yc,thetac,connection,parameters)
     % Facing -ve X-axis 
    if (3.141 < thetac && thetac < 3.142)
        [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
    % Facing +ve Y-axis
    elseif (1.5707 < thetac && thetac < 1.5708)        
        [thetac] = TurnLeft(xc, yc, thetac, connection, parameters);
        [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
    % Facing -ve Y-axis
    elseif (-1.5709 < thetac && thetac < -1.5707)
        [thetac] = TurnRight(xc, yc, thetac, connection, parameters);
        [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
    % Facing +ve X-axis 
    elseif (-0.001 < thetac && thetac < 0.001)
        [thetac] = TurnRight(xc, yc, thetac, connection, parameters);
        [thetac] = TurnRight(xc, yc, thetac, connection, parameters);
        [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters);
    end
    