%{
for j=1:n
          plot_command
          M(j) = getframe;
       end
       movie(M)
%}

%{
x = 1:10
y = x .* x


for t = 1:10
    plot(x, y + t);
    xlim([0, 60])
    ylim([0, 60])
    pause(1)
end
%}

%{
for t = 1:10
    xlim([0, 60])
    ylim([0, 60])
    line([10, 10], [10, 10 + 5*t])

    % final project frame rate
    pause(0.1)
end
%}

% testing 'handles'
xlim([0, 10]);
ylim([0, 10]);
h1 = line([0, 1], [2, 3])
h2 = line([4, 5], [9, 8])
pause(3)
delete(h2)
% matlab does not autoclose