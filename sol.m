map = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
1 0 0 0 1 0 0 0 0 0 0 1 0 0 1
1 0 1 0 1 0 1 1 1 1 0 1 0 0 1
1 0 1 0 0 0 0 0 0 0 0 1 1 0 1
1 0 1 1 0 1 1 1 1 0 1 0 0 0 1
1 0 0 0 0 0 0 0 0 0 1 0 1 0 1
1 1 1 0 1 1 1 1 0 1 1 0 1 0 1
1 0 0 0 0 0 0 0 0 0 0 0 0 0 1
1 0 1 1 1 0 1 0 1 1 1 1 0 1 1
1 0 0 0 0 0 1 0 0 0 0 0 0 0 1
1 1 1 1 0 1 1 0 1 0 1 1 1 0 1
1 0 0 0 0 0 0 0 1 0 0 0 0 0 1
1 0 1 1 1 1 0 1 1 0 1 0 1 1 1
1 0 0 0 0 0 0 0 0 0 0 0 0 0 1
1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

% map= [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
% 1 0 0 0 1 0 0 0 0 0 0 0 0 0 1
% 1 0 1 0 1 0 1 1 1 1 1 0 1 0 1
% 1 0 1 0 0 0 1 0 1 0 0 0 1 0 1
% 1 0 1 1 0 1 1 0 1 0 1 1 1 0 1
% 1 0 1 0 0 0 0 0 0 0 0 0 1 0 1
% 1 0 1 0 1 1 1 1 0 1 1 1 1 0 1
% 1 0 1 0 1 0 0 0 0 0 0 0 0 0 1
% 1 0 1 0 1 0 1 1 1 0 1 0 1 1 1
% 1 0 0 0 0 0 1 0 0 0 1 0 0 0 1
% 1 1 1 1 0 1 1 0 1 1 1 0 1 0 1
% 1 0 0 0 0 0 0 0 1 0 1 0 1 0 1
% 1 0 1 1 1 0 1 1 1 0 1 0 1 0 1
% 1 0 0 0 0 0 1 0 0 0 0 0 1 0 1
% 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

% map = [1 1 1 1 1 1 1 1 1 1
% 1 0 0 0 0 0 0 0 0 1
% 1 0 1 1 1 1 1 1 0 1
% 1 0 1 0 0 0 0 1 0 1
% 1 0 1 0 1 1 0 1 0 1
% 1 0 1 0 1 1 0 1 0 1
% 1 0 1 0 0 0 0 1 0 1
% 1 0 1 1 1 1 1 1 0 1
% 1 0 0 0 0 0 0 0 0 1
% 1 1 1 1 1 1 1 1 1 1
% ];
% map = [1 1 1 1 1 1 1 1 1 1
% 1 0 0 0 0 0 0 0 0 1
% 1 0 1 1 1 1 1 1 0 1
% 1 0 1 1 1 1 1 1 0 1
% 1 0 0 0 0 0 0 0 0 1
% 1 1 1 1 1 1 1 1 1 1];


start = [2, 2];
finish = [14, 14];

path = backtrack(map,start,finish);

imagesc(map);
hold on

plot(path(:,1), path(:,2), 'g.', MarkerSize=10);

hold off