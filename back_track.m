function path = back_track(map, start, finish)

    % Initialize variables
    [m, n] = size(map); % dimensions of the maze
    path = start; % initialize the path with the start position
    found = 0; % initialize the found flag to false
    directions = [1, 0; -1, 0; 0, 1; 0, -1]; % [right, left, down, up]

    % Repeat until the finish is found or the maze is fully explored
    while ~found && sum(map(:)) < m*n
        % Generate a random neighboring position
        neighbors = path(end,:) + directions; % generate all possible neighbors
        neighbors = unique(neighbors, 'rows'); % remove duplicates
        neighbors = neighbors(all(neighbors > 0, 2) & ... % remove neighbors outside the maze
                            neighbors(:,1) <= m & ...
                            neighbors(:,2) <= n, :);
        neighbors = neighbors(map(sub2ind([m, n], neighbors(:,1), neighbors(:,2))) == 0, :); % remove visited positions
        if ~isempty(neighbors)
            next = neighbors(randi(size(neighbors, 1)), :); % select a random valid neighbor
            path = [path; next]; % add the selected neighbor to the path
            map(next(1), next(2)) = 1; % mark the selected neighbor as visited
        else
            path(end, :) = []; % no valid neighbors, backtrack
        end

        % Check if the finish has been found
        if path(end, :) == finish
            found = 1;
        end
    end
end
