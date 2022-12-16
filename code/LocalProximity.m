function proximity = LocalProximity(connection)
    [leftVelRadPerSec, rightVelRadPerSec, PFr, PBr, PRr, PLr] = bob_getWheelSpeeds(connection);
    proximity = [PFr, PBr, PRr, PLr];
