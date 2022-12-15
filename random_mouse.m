function path = random_mouse(map, start, finish)
    % Check input arguments
    if nargin < 3
        error('Not enough input arguments');
    end

    % Initialize variables
    [m, n] = size(map); % dimensions of the maze
    path = start; % initialize the path with the start position
    visited = zeros(m, n); % initialize the visited array
    visited(start(1), start(2)) = 1; % mark the start position as visited
    found = 0; % initialize the found flag to false
    directions = [1, 0; -1, 0; 0, 1; 0, -1]; % [right, left, down, up]

    % Repeat until the finish is found or the maze is fully explored
    while ~found && sum(visited(:)) < m*n
        % Generate a random neighboring position
        neighbors = path(end,:) + directions; % generate all possible neighbors
        neighbors = unique(neighbors, 'rows') % remove duplicates
        valid_neighbors = neighbors(all(neighbors > 0, 2) & ... % remove neighbors outside the maze
                            neighbors(:,1) <= m & ...
                            neighbors(:,2) <= n, :)
        valid_neighbors = neighbors(map(sub2ind([m, n], neighbors(:,1), neighbors(:,2))) == 0 & ... % remove walls
                            visited(sub2ind([m, n], neighbors(:,1), neighbors(:,2))) == 0, :); % remove visited positions
        if ~isempty(valid_neighbors)
            next = valid_neighbors(randi(size(valid_neighbors, 1)), :); % select a random valid neighbor
            path = [path; next]; % add the selected neighbor to the path
            visited(next(1), next(2)) = 1; % mark the selected neighbor as visited
        else
            path(end, :) = []; % no valid neighbors, backtrack
        end

        % Check if the finish has been found
        if path(end, :) == finish
            found = 1;
        end
    end
end
