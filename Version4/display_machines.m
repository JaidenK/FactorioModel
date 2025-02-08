function display_machines(x_machines)
%DISPLAY_MACHINES Prints all non-zero entries of the Machines vector
%   Will automatically determine if x is the 1-dimensional vector (list of
%   unit-producers) or 2-dimensional matrix (matrix of specific machine
%   implementations)
global machine_names
assert(isequal(size(x_machines,1),size(machine_names,1)),"Machines vector must have same number of rows as machine names.");

[rows,~,values] = find(x_machines);
for i = 1:length(rows)
    fprintf("%s\t%g\n",machine_names(rows(i)),values(i))
end




end

