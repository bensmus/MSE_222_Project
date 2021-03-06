%MSE 222 - readme

%Assumptions page: these assumptions for all file functions unless
%otherwise noted

% ---------- impact -----------
%marble : marble points
%obstacle : obstacle points 

%inputs of impact function: vel vector, object vector

% -----------------------------

%radius: represented as millimeter
%time : represented as milliseconds 
%distance : represented as millimeter
%velocity : m/s (input)-> mm/ms (storage unaffected)
%acceleration : m/s^2 (input) -> mm/ms^2 (storage affected: divide all acceleration eq by 1000)
%force : N (input) -> kg*mm/ms^2 (calculations affected: divide all forces by 1000 b/c acceleration)