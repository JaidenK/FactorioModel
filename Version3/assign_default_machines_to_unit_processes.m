function [x2] = assign_default_machines_to_unit_processes(x)
%ASSIGN_MACHINES_TO_UNIT_PROCESSES Summary of this function goes here
%   Detailed explanation goes here
global processes_struct crafting_speed_factor
assert(isequal(size(x,1),size(processes_struct,1)),"Processes vector must have same number of rows as processes.");
assert(isequal(size(x,2),1),"Input process vector must be a column vector");

% Each row is a process. Each column is a machine. This matrix represents
% how many machines are running each process.
x2 = zeros(size(processes_struct,1), size(crafting_speed_factor,1));

% Assign each process to its default machine
for i=1:length(x)
    x2(i,processes_struct(i).DefaultMachineIndex) = x(i)/crafting_speed_factor(processes_struct(i).DefaultMachineIndex);
end

end

