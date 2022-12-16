function path = pledge(map, start, finish)
%PLEDGE_ALGORITHM Finds a path from start to finish using the Pledge algorithm
%   path = PLEDGE_ALGORITHM(map, start, finish) finds a path from the starting
%   position (start) to the finishing position (finish) on the given map.
%   The map is a 2D matrix where 0 represents a free cell and 1 represents a
%   wall. The start and finish positions are given as 1x2 arrays in the form
%   [row, column]. The function returns the path as a 2D matrix, where each
%   row represents a position on the map in the form [row, column].

% Initialize the path with the starting position
path = start;

% Set the initial direction to face the finish position
if start(1) < finish(1)
    direction = [1, 0]; % facing down
elseif start(1) > finish(1)
    direction = [-1, 0]; % facing up
elseif start(2) < finish(2)
    direction = [0, 1]; % facing right
elseif start(2) > finish(2)
    direction = [0, -1]; % facing left
end

% Initialize the sum of turns made to 0
turns_sum = 0;

while ~isequal(path(end,:), finish)
    % Move in the current direction
    next = path(end,:) + direction;
    
    % If the next position is not a wall, add it to the path
    if map(next(1), next(2)) == 0
        path = [path; next];
    else
        % Turn clockwise and add the new direction to the path
        direction = [direction(2), -direction(1)];
        path = [path; path(end,:) + direction];
        
        % Update the sum of turns made
        turns_sum = turns_sum + 1;
        
        % Keep following the wall until the sum of turns made is 0
        while turns_sum ~= 0
            % Turn clockwise and add the new direction to the path
            direction = [direction(2), -direction(1)];
            path = [path; path(end,:) + direction];
            
            % Update the sum of turns made
            if map(path(end,1), path(end,2)) == 0
                turns_sum = turns_sum + 1;
            else
                turns_sum = turns_sum - 1;
            end
        end
    end
end
end