% Define the dimensions of the maze
maze_width = 50;
maze_height = 50;

% Initialize the maze with all walls
maze = ones(maze_height, maze_width);

% Define the starting point for the algorithm
current_pos = [1, 1];

% Define the directions for the algorithm to move in
directions = [1, 0; 0, 1; -1, 0; 0, -1];

% Recursively carve out the maze
maze = recursive_backtracker(maze, current_pos, directions);

function maze = recursive_backtracker(maze, current_pos, directions)
    % Mark the current position as visited
    maze(current_pos(1), current_pos(2)) = 0;

    % Shuffle the directions to randomize the order in which they are tried
    directions = directions(randperm(size(directions, 1)), :);

    % Loop through each direction
    for i = 1:size(directions, 1)
        % Calculate the position of the next cell in this direction
        next_pos = current_pos + directions(i, :)

        % Check if the next cell is within the bounds of the maze
        if all(next_pos > 0) && next_pos(1) <= size(maze, 1) && next_pos(2) <= size(maze, 2)
            % Check if the next cell has not been visited
            if maze(next_pos(1), next_pos(2)) == 1
                % Carve a path from the current cell to the next cell
                maze(current_pos(1) + directions(i, 1), current_pos(2) + directions(i, 2)) = 0;

                % Recursively carve out the maze from the next cell
                maze = recursive_backtracker(maze, next_pos, directions);
            end
        end
    end
end
