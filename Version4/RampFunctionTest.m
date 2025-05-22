clear all; close all; clc;

ramp = @(t) t.*(t>zeros(size(t)));

a = 1;
t = -5:.1:5;

figure();
plot(t,ramp(t));
hold on;
plot(t,ramp(t-a));
xline(a);
axis equal
grid on