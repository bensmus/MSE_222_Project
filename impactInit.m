% initial impact function 
% calculates the velocity that follows the impact

%assumed: starts from rest (initial), horizontal hit (0 deg)
%rewrite to account for time = 0, time = contact, time = after contact 

%function can only occur for a specific impact time (TBD) 
function [V_X2, V_Y2] = impactInit(F, R, T, M)

V_X2 = (F*R*T)/((-M*R)+((4/3)*pi()*R*R));
V_Y2 = 0;