function path = recursive_backtrack(map, start, finish)
% Initialize variables
path = start; % The path starts at the starting cell
visited = start; % List of visited cells
num_rows = size(map, 1); % Number of rows in the map
num_cols = size(map, 2); % Number of columns in the map
curr_cell = start; % The current cell
% Recursive function to find the path
function recursive_backtrack_helper(curr_cell)
    % Check if the current cell is the finishing cell
    if curr_cell == finish
        % The path is complete, return
        return;
    end

    % Get the walls of the current cell
    walls = map(curr_cell(1), curr_cell(2));

    % Check if there is a wall to the right and if the cell to the right
    % has not been visited
    if curr_cell(2)+1 <= num_cols && bitget(walls, 1) == 0 && ~ismember([curr_cell(1), curr_cell(2)+1], visited, 'rows')
        % Add the cell to the right to the path and mark it as visited
        path = [path; [curr_cell(1), curr_cell(2)+1]];
        visited = [visited; [curr_cell(1), curr_cell(2)+1]];
        % Recursively call the function with the cell to the right as
        % the current cell
        recursive_backtrack_helper([curr_cell(1), curr_cell(2)+1]);
    end

    % Check if there is a wall down and if the cell below has not been
    % visited
    if curr_cell(1)+1 <= num_rows && bitget(walls, 2) == 0 && ~ismember([curr_cell(1)+1, curr_cell(2)], visited, 'rows')
        % Add the cell below to the path and mark it as visited
        path = [path; [curr_cell(1)+1, curr_cell(2)]];
	    visited = [visited; [curr_cell(1)+1, curr_cell(2)]];
        % Recursively call the function with the cell to the below as
        % the current cell
        recursive_backtrack_helper([curr_cell(1)+1, curr_cell(2)]);
    end

% Check if there is a wall to the left and if the cell to the left
% has not been visited
if curr_cell(2)-1 > 0 && bitget(walls, 3) == 0 && ~ismember([curr_cell(1), curr_cell(2)-1], visited, 'rows')
% Add the cell to the left to the path and mark it as visited
path = [path; [curr_cell(1), curr_cell(2)-1]];
visited = [visited; [curr_cell(1), curr_cell(2)-1]];
% Recursively call the function with the cell to the left as
% the current cell
recursive_backtrack_helper([curr_cell(1), curr_cell(2)-1]);
end

% Check if there is a wall up and if the cell above has not been
% visited
if curr_cell(1)-1 > 0 && bitget(walls, 4) == 0 && ~ismember([curr_cell(1)-1, curr_cell(2)], visited, 'rows')
    % Add the cell above to the path and mark it as visited
    path = [path; [curr_cell(1)-1, curr_cell(2)]];
    visited = [visited; [curr_cell(1)-1, curr_cell(2)]];
    % Recursively call the function with the cell above as
    % the current cell
    recursive_backtrack_helper([curr_cell(1)-1, curr_cell(2)]);
end

end

% Call the recursive function with the starting cell as the current cell
recursive_backtrack_helper(curr_cell);
end