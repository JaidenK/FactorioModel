function action_matrix = new_action(proces_machine_qty_triples)
%NEW_ACTION Summary of this function goes here
%   Detailed explanation goes here
global processes_struct machine_names

action_matrix = zeros(size(processes_struct,1),size(machine_names,1));

% This conditional allows them to pass no arguments and receive the
% properly sized zero vector as a result
if(exist('proces_machine_qty_triples','var'))
    % Find the row indices that are specified 
    [rows,~] = process_names_to_indices([proces_machine_qty_triples{:,1}]);
    [cols,~] = machine_names_to_indices([proces_machine_qty_triples{:,2}]);
    
    for i=1:size(proces_machine_qty_triples,1)
        % Slap those bad boys in there
        action_matrix(rows(i),cols(i)) = proces_machine_qty_triples{i,3};
    end
end
end

