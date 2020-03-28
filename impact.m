% function that returns the V_Gy and V_Gx after an impact(based on Lec21)

% R = radius of marble
% E = coefficient of restitution (material dependent. use look-up table)

function [V_X2, V_Y2] = impact(V_X1, V_Y1, R, E)
omega1 = sqrt((V_X1*V_X1)+(V_Y1*V_Y1))/R;
V_Y2 = (-E)*(V_Y1);
V_X2 = (5/7)*(V_X1-((2/5)*omega1*R))
