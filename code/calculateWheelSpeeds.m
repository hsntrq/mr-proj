function [ LeftWheelVelocity, RightWheelVelocity ] = calculateWheelSpeeds( v, omega, parameters )
% This function computes the motor velocities for a differential drive
% robot. The arguments are:
% v: Linear velocity of the robot
% omega: Angular velocity of the robot
% parameters: Structure containing the wheel radius and interwheel
% distance. 

%% Extract parameter values
wheelRadius = parameters.wheelRadius;
L = parameters.interWheelDistance;

%% Compute Wheel Velocities

RightWheelVelocity = ((v) + (omega * L/2)) / (wheelRadius);
LeftWheelVelocity = ((v) - (omega * L/2)) / (wheelRadius);


end
