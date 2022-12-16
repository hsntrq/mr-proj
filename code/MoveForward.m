function [xc, yc] = MoveForward(xc,yc, thetac, connection, parameters)
    % Facing -ve X-axis 
    if (3.141 < thetac && thetac < 3.142)
        MoveController(xc-0.5,yc,thetac, connection, parameters);
        xc = xc-0.5;
    % Facing +ve Y-axis
    elseif (1.5707 < thetac && thetac < 1.5708)
        MoveController(xc,yc+0.5,thetac, connection, parameters);
        yc = yc+0.5;
    % Facing -ve Y-axis
    elseif (-1.5709 < thetac && thetac < -1.5707)
        MoveController(xc,yc-0.5,thetac, connection, parameters);
        yc = yc-0.5;
    % Facing +ve X-axis 
    elseif (-0.001 < thetac && thetac < 0.001)
        MoveController(xc+0.5,yc,thetac, connection, parameters);
        xc = xc+0.5;
    end
