StartTime = 0;
EndTime = 15;
xAxisTicks = [StartTime 2.5 5 7.5 10 12.5 EndTime];


%%  Cart values
CartPos = Data_Cart(:,1);
CartVelocity = Data_Cart(:,2);

%CartPos(1:709) = [];
%CartVelocity(1:709) = [];

% Cart without external forces
figure(1);
time = linspace(StartTime, EndTime, length(CartPos)); 
p1 = plot(time, CartPos, 'LineWidth', 1, 'Color', '#EDB120');
hold on
time = linspace(StartTime, EndTime, length(CartVelocity)); 
p2 = plot(time, CartVelocity, 'LineWidth', 1, 'Color', '#0072BD');
ylabel('Cart')
xlabel('Seconds')
xticks(xAxisTicks)
legend([p1 p2],{'Position', 'Velocity'})
ylim([-1.75 1.5])
grid on


%%  Pendulum values
PendulumAngle = Data_Angle(:,1);
PendulumVelocity = Data_Angle(:,2);
PendulumAcceleration = Data_Angle(:,3);

%PendulumAngle(1:709) = [];
%PendulumVelocity(1:709) = [];
%PendulumAcceleration(1:709) = [];


% Pendulum without external forces
figure(2);
time = linspace(StartTime, EndTime, length(PendulumAngle)); 
p1 = plot(time, PendulumAngle, 'LineWidth', 1, 'Color', '#EDB120');
hold on
time = linspace(StartTime, EndTime, length(PendulumVelocity)); 
p2 = plot(time, PendulumVelocity, 'LineWidth', 1, 'Color', '#0072BD');
hold on
time = linspace(StartTime, EndTime, length(PendulumAcceleration)); 
p3 = plot(time, PendulumAcceleration, 'LineWidth', 1, 'Color', '#77AC30');
ylabel('Pendulum')
xlabel('Seconds')
xticks(xAxisTicks)
legend([p1 p2 p3],{'Angle', 'Velocity', 'Acceleration'})
ylim([-400 150])
grid on


