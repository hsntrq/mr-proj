function path = tremaux(map, start, finish)
%TREMAUX Find a path from start to finish using Trémaux's algorithm
%   Inputs:
%       map: a 2D matrix representing the maze, with 1s indicating walls and
%       0s indicating open space
%       start: a 1x2 array representing the starting coordinates [row, col]
%       finish: a 1x2 array representing the finishing coordinates [row, col]
%   Output:
%       path: a 2D matrix representing the path from start to finish

% Initialize the path matrix with all zeros
marks = zeros(size(map));

% Set the starting position in the path matrix
marks(start(1), start(2)) = 1;

% Initialize the current position and direction to the start position and
% north, respectively
currentPos = start;
path = start;
dir = [0, 1];

% While the current position is not the finish position
while ~isequal(currentPos, finish)
    % Check the cell in the current direction
    nextPos = currentPos + dir;
    if map(nextPos(1), nextPos(2)) == 0
        % If the cell is open, mark it in the path matrix and update the
        % current position and direction
        marks(nextPos(1), nextPos(2)) = 1;
        currentPos = nextPos;
        path = [path; nextPos];
        continue;
    end
    
    % If the cell is a wall, turn right and update the direction
    dir = [dir(2), -dir(1)];
    marks(currentPos(1), currentPos(2)) = -1;
end
end
