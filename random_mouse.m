function path = random_mouse(map, start, finish)
%RANDOMMOUSE Finds a path from start to finish using the random mouse algorithm
%   path = RANDOMMOUSE(map, start, finish) finds a path from the starting
%   position (start) to the finishing position (finish) on the given map.
%   The map is a 2D matrix where 0 represents a free cell and 1 represents a
%   wall. The start and finish positions are given as 1x2 arrays in the form
%   [row, column]. The function returns the path as a 2D matrix, where each
%   row represents a position on the map in the form [row, column].

% Add the starting position to the path
path = start;


    [m, n] = size(map); % dimensions of the maze

directions = [1, 0; -1, 0; 0, 1; 0, -1]; % [right, left, down, up]

% While the current position is not the finishing position
while ~isequal(path(end,:), finish)
    % Find the valid moves from the current position (up, down, left, right)
        neighbors = path(end,:) + directions; % generate all possible neighbors
        neighbors = unique(neighbors, 'rows'); % remove duplicates
        neighbors = neighbors(all(neighbors > 0, 2) & ... % remove neighbors outside the maze
                            neighbors(:,1) <= m & ...
                            neighbors(:,2) <= n, :);
        neighbors = neighbors(map(sub2ind([m, n], neighbors(:,1), neighbors(:,2))) == 0, :); % remove visited positions
    
    % If there are no valid moves, return an empty path (no solution)
    if isempty(neighbors)
        path = [];
        return;
    end
    
    % Choose a random valid move
    next = neighbors(randi(size(neighbors, 1)), :);
    
    % Add the move to the path
    path = [path; next];
end
end