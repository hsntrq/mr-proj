function path = backtrack(map, start, finish)
%BACKTRACK Finds a path from start to finish in a maze using recursive backtracking
%   map: Occupancy grid map of the maze, where 0 represents empty space and 1 represents walls
%   start: Starting coordinates [x, y]
%   finish: Finishing coordinates [x, y]
%   path: Array of coordinates [x1, y1; x2, y2; ...] representing the path from start to finish

% Initialize path
path = [];

% Define directions
directions = [1, 0; -1, 0; 0, 1; 0, -1]; % [right, left, down, up]

% Recursive function to find path
function findPath(current)
    % Add current position to path
    path(end+1,:) = current;
    
    % Check if current position is the finish
    if isequal(current, finish)
        return
    end
    
    % Mark current position as visited
    map(current(2), current(1)) = 1;
    
    % Shuffle directions
    directions = directions(randperm(size(directions,1)),:);
    
    % Check each direction
    for i = 1:size(directions,1)
        next = current + directions(i,:);
        if isValid(next) && ~map(next(2), next(1))
            findPath(next);
        end
    end
end

% Check if a position is valid
function valid = isValid(pos)
    valid = pos(1) >= 1 && pos(1) <= size(map,2) && pos(2) >= 1 && pos(2) <= size(map,1);
end

% Start recursive backtracking
findPath(start);

% Remove duplicate finish position from path
path = unique(path, 'rows', 'stable');

end

