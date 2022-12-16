% Define occupancy grid map of the maze
map = [0, 0, 0, 0, 0, 0;
       0, 1, 1, 1, 1, 0;
       0, 0, 0, 0, 0, 0;
       0, 1, 1, 1, 1, 0;
       0, 0, 0, 0, 0, 0];

% Define start and finish coordinates
start = [1, 1];
finish = [5, 5];

% Find path using recursive backtracking
path = backtrack(map, start, finish);
