function [rows,cols] = process_names_to_indices(names)
global processes_struct
% Find the row indices that are specified 
[rows,cols] = find([processes_struct(:).Name]'==names(:)');
% Confirm they were all found (typo check)
assert(length(rows) == length(names),"Could not find all process names. Was there a typo?"); % TODO: include names in message. Breaking when names is an array.
end

