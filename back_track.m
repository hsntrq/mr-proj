function [map, path] = back_track(m,n, start, finish, xc,yc,thetac,connection,parameters)
    % Initialize variables
    map = zeros(m,n); % dimensions of the maze
    path = start; % initialize the path with the start position
    found = 0; % initialize the found flag to false
    directions = [ 0, -1; 0, 1; 1, 0; -1, 0]; % [right, left, down, up]
    visited = zeros(m,n);
    visited(start(1),start(2)) = 1;
    % Repeat until the finish is found or the maze is fully explored
    while ~found && sum(visited(:)) < m*n
        % Generate a random neighboring position
        neighbors = path(end,:) + directions; % generate all possible neighbors
        % neighbors = unique(neighbors, 'rows'); % remove duplicates
        proximity = GlobalProximity(connection, thetac);
        map(path(end,:)) = bin2dec(num2str(proximity));
        neighbors = neighbors(proximity == 0, :);
        neighbors = neighbors(all(neighbors > 0, 2) & ... % remove neighbors outside the maze
                            neighbors(:,1) <= m & ...
                            neighbors(:,2) <= n, :);
        neighbors = neighbors(visited(sub2ind([m, n], neighbors(:,1), neighbors(:,2))) == 0, :); % remove visited positions
        
        if ~isempty(neighbors) 
            next = neighbors(randi(size(neighbors, 1)), :); % select a random valid neighbor
            path = [path; next]; % add the selected neighbor to the path
            [xc,yc,thetac] = moveDirection(path(end-1,:),path(end,:),xc,yc,thetac,connection,parameters);
            visited(next(1), next(2)) = 1; % mark the selected neighbor as visited
        else
            [xc,yc,thetac] = moveDirection(path(end,:),path(end-1,:),xc,yc,thetac,connection,parameters);
            path(end, :) = []; % no valid neighbors, backtrack
        end

        if isempty(path)
            return
        end

        % Check if the finish has been found
        if path(end, :) == finish
            found = 1;
        end
    end
end