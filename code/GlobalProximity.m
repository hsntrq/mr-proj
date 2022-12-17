function updatedProximity = GlobalProximity(connection, thetac)
    proximity = LocalProximity(connection);
    if (3.141 < thetac && thetac < 3.142)
        updatedProximity = proximity;
    % Facing +ve Y-axis
    elseif (1.5707 < thetac && thetac < 1.5708)
        updatedProximity(1) = proximity(4);
        updatedProximity(2) = proximity(3);
        updatedProximity(3) = proximity(1);
        updatedProximity(4) = proximity(2);
    % Facing -ve Y-axis
    elseif (-1.5709 < thetac && thetac < -1.5707)
        updatedProximity(1) = proximity(3);
        updatedProximity(2) = proximity(4);
        updatedProximity(3) = proximity(2);
        updatedProximity(4) = proximity(1);
    % Facing +ve X-axis 
    elseif (-0.001 < thetac && thetac < 0.001)
        updatedProximity(1) = proximity(2);
        updatedProximity(2) = proximity(1);
        updatedProximity(3) = proximity(4);
        updatedProximity(4) = proximity(3);
    end
end