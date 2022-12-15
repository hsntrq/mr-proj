map = [0b1101 0b1000 0b1101 0b1010 0b1100;
       0b1001 0b1010 0b1011 0b1010 0b1011;
       0b1101 0b1010 0b1010 0b1000 0b1001;
       0b1001 0b1000 0b1001 0b1010 0b1001;
       0b1101 0b1001 0b1101 0b1001 0b1101];

start = [1, 1];
finish = [4, 4];
path = recursive_backtrack(map, start, finish);
% disp(path);

% Create a figure and hold on to the axes
hold on;

% Loop over each cell in the map
[m,n] = size(map);
for i = 1:m
  for j = 1:n
    % Get the walls of the current cell
    walls = map(i,j);
    
    % Check if the down wall is present
    if bitget(walls,2)
      % Draw a line for the down wall
      plot([j-1.5 j-0.5], [i-0.5 i-0.5], 'k', 'LineWidth', 2);
    end
    
    % Check if the up wall is present
    if bitget(walls,4)
      % Draw a line for the up wall
      plot([j-1.5 j-0.5], [i+0.5 i+0.5], 'k', 'LineWidth', 2);
    end
    
    % Check if the right wall is present
    if bitget(walls,1)
      % Draw a line for the right wall
      plot([j-0.5 j-0.5], [i-0.5 i+0.5], 'k', 'LineWidth', 2);
    end
    
    % Check if the left wall is present
    if bitget(walls,3)
      % Draw a line for the left wall
      plot([j-1.5 j-1.5], [i-0.5 i+0.5], 'k', 'LineWidth', 2);
    end
  end
end

% Adjust the axes to fit the map
% axis tight;
% axis equal;

% plot(path(:,2), path(:,1), 'r', LineWidth=2)
hold off;
axis off;
