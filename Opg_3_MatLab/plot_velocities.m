fig1 = figure(1);
plot(velocity_nonlinear)
hold on;
% plot(velocity_linear)
legend('Nonlinearized velocity')
ylabel('m/s')
title('')
hold off;

saveas(fig1,'DiscretImplementering_20s.jpg');