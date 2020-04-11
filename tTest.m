% Teresa's Test space

X1 = 0;
Y1 = 0;
R = 0.007;
E = 3;
T = 0;
M = 0.00378; %using formula, est. at 3.78 grams
F = 1;

%% impact Vert test

% try to make it time based somehow 

[X, Y] = impactVert(X1,Y1,R,E);

%% impact horizontal test 

[X, Y] = impactInit(F,R,T,M)
