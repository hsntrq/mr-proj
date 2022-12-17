function [xc,yc,thetac] = moveDirection(curr, next, xc,yc,thetac,connection,parameters)
    direction = next - curr;
    if direction ==  [1, 0]
        [xc,yc,thetac] = GoYpositive(xc,yc,thetac,connection,parameters);
    elseif direction ==  [-1, 0]
        [xc,yc,thetac] = GoYnegative(xc,yc,thetac,connection,parameters);
    elseif direction ==  [0, 1]
        [xc,yc,thetac] = GoXpositive(xc,yc,thetac,connection,parameters);
    elseif direction ==  [0, -1]
        [xc,yc,thetac] = GoXnegative(xc,yc,thetac,connection,parameters);
    end
end