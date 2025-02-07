function [b] = new_rate_vector(item_name_qty_pairs)
%NEW_RATE_VECTOR Converts a cell array to a rate vector
%   Input should be a cell array with 2 columns and variable rows.
%   Ex: {"electronic_circuit", 3; "copper_plate", 100; "iron_plate", 150}
global item_names

% Initialize 0 vector
b = zeros(size(item_names));
% Find the row indices that are specified 
[rows,~] = item_names_to_indices([item_name_qty_pairs{:,1}]);
% Slap those bad boys in there
b(rows) = [item_name_qty_pairs{:,2}]';
    
end

