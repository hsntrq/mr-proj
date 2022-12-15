function [path] = pledge(map, start, finish)
    % Initialize empty path
    path = [];

    % Get dimensions of map
    [n, m] = size(map);

    % Initialize variables for current position and direction
    x = start(1);
    y = start(2);
    dx = 0;
    dy = 1;

    % While the current position is not the finish
    while x ~= finish(1) || y ~= finish(2)
        % Check if the next cell in the current direction is within the bounds of the map
        if x+dx > 0 && y+dy > 0 && x+dx <= n && y+dy <= m
            % Check if the next cell in the current direction is open
            if map(x+dx, y+dy)
                % If it is, move to the next cell
                x = x + dx;
                y = y + dy;
                % Add the new position to the path
                path = [path; x, y];
            else
                if randi([0,1], 1, 1)
                    % If it is not, turn clockwise
                    temp = dx;
                    dx = -dy;
                    dy = temp;
                else
                    temp = dx;
                    dx = dy;
                    dy = -temp;
                end
            end
            else
                if randi([0,1], 1, 1)
            % If it is not within the bounds of the map, turn clockwise
            temp = dx;
            dx = -dy;
            dy = temp;
                else
                    temp = dx;
                    dx = dy;
                    dy = -temp;
                end
        end
    end
end
