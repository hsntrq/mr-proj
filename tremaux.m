function [map, path] = tremaux(m,n, start, finish, xc,yc,thetac,connection,parameters)
%TREMAUX Finds a path from start to finish using Trémaux's algorithm
%   path = TREMAUX(map, start, finish) finds a path from the starting
%   position (start) to the finishing position (finish) on the given map.
%   The map is a 2D matrix where 0 represents a free cell and 1 represents a
%   wall. The start and finish positions are given as 1x2 arrays in the form
%   [row, column]. The function returns the path as a 2D matrix, where each
%   row represents a position on the map in the form [row, column].

% Initialize the path with the starting position
path = start;

% Initialize the directions we can move (right, left, down, up)
    directions = [ 0, -1; 0, 1; 1, 0; -1, 0]; % [right, left, down, up]

% Initialize the marks array to keep track of which entrances have been marked
    map = zeros(m,n); % dimensions of the maze
marks = zeros(m, n);

% While the current position is not the finishing position
while ~isequal(path(end,:), finish)
    % Find the valid moves from the current position (up, down, left, right)
    neighbors = path(end,:) + directions; % generate all possible neighbors
    proximity = GlobalProximity(connection, thetac);
        map(path(end,1), path(end,2)) = bin2dec(num2str(proximity));
    neighbors = neighbors(proximity == 0, :);
    neighbors = neighbors(all(neighbors > 0, 2) & ... % remove neighbors outside the maze
                        neighbors(:,1) <= m & ...
                        neighbors(:,2) <= n, :);
%     neighbors = neighbors(map(sub2ind([m, n], neighbors(:,1), neighbors(:,2))) == 0, :); % remove walls
    
    % If there are no valid moves, return an empty path (no solution)
    if isempty(neighbors)
        path = [];
        return;
    end
    
    % Find the marked entrances at the current junction
    marked = marks(sub2ind([m, n], neighbors(:,1), neighbors(:,2))) > 0;
    
    % If there are no marked entrances, choose an arbitrary unmarked entrance
    if all(marked == 0)
        next = neighbors(randi(size(neighbors, 1)), :);
    % If there is only one marked entrance (the one we just came from), choose an arbitrary unmarked entrance
    elseif sum(marked) == 1
        next = neighbors(marked == 0, :);
        if isempty(next)
            % If there are no unmarked entrances, turn around and return
            [xc,yc,thetac] = moveDirection(path(end,:),path(end-1,:),xc,yc,thetac,connection,parameters);
            path = path(1:end-1,:);
        else
            % Otherwise, choose an unmarked entrance at random
            next = next(randi(size(next, 1)), :);
        end
    % Otherwise, choose the entrance with the fewest marks
    else
        [~, idx] = min(marks(sub2ind([m, n], neighbors(:,1), neighbors(:,2))));
        next = neighbors(idx, :);
    end
    
    % Mark the entrance as we pass through it
    if ~isempty(next)
        marks(sub2ind([m, n], next(1), next(2))) = marks(sub2ind([m, n], next(1), next(2))) + 1;
    end
    % Add the move to the path
    path = [path; next];
    [xc,yc,thetac] = moveDirection(path(end-1,:),path(end,:),xc,yc,thetac,connection,parameters);
end
end

