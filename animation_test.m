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

for t = 1:10
    xlim([0, 60])
    ylim([0, 60])
    line([10, 10], [10, 10 + 5*t])
    pause(1)
end






