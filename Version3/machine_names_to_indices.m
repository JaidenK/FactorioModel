function [rows,cols] = machine_names_to_indices(names)
global machine_names
% todo: Consider testing to see if we need to transpose the input
% Find the row indices that are specified 
[rows,cols] = find(machine_names==names);
% Confirm they were all found (typo check)
assert(length(rows) == length(names),"Could not find all machine names. Was there a typo?"); % TODO: include names in message. Breaking when names is an array.
end
