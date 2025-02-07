clear global processes_struct
global processes_struct A_unit A

% Mining
processes_struct(1).Name = "coal_mining";
processes_struct(end).Period = 1;
processes_struct(end).ResourceNames = ["coal"];
processes_struct(end).ResourceValues = [1];
processes_struct(end).DefaultMachine = "electric_mining_drill";


processes_struct(end+1).Name = "stone_mining";
processes_struct(end).Period = 1;
processes_struct(end).ResourceNames = ["stone"];
processes_struct(end).ResourceValues = [1];
processes_struct(end).DefaultMachine = "electric_mining_drill";

processes_struct(end+1).Name = "iron_mining";
processes_struct(end).Period = 1;
processes_struct(end).ResourceNames = ["iron_ore"];
processes_struct(end).ResourceValues = [1];
processes_struct(end).DefaultMachine = "electric_mining_drill";

processes_struct(end+1).Name = "copper_mining";
processes_struct(end).Period = 1;
processes_struct(end).ResourceNames = ["copper_ore"];
processes_struct(end).ResourceValues = [1];
processes_struct(end).DefaultMachine = "electric_mining_drill";

processes_struct(end+1).Name = "uranium_mining";
processes_struct(end).Period = 2;
processes_struct(end).ResourceNames = ["uranium_ore"];
processes_struct(end).ResourceValues = [1];
processes_struct(end).DefaultMachine = "electric_mining_drill";

% Smelting
processes_struct(end+1).Name = "iron_plate_smelting";
processes_struct(end).Period = 3.2;
processes_struct(end).ResourceNames = ["iron_plate" "iron_ore"];
processes_struct(end).ResourceValues = [1 -1];
processes_struct(end).DefaultMachine = "electric_furnace";

processes_struct(end+1).Name = "copper_plate_smelting";
processes_struct(end).Period = 3.2;
processes_struct(end).ResourceNames = ["copper_plate" "copper_ore"];
processes_struct(end).ResourceValues = [1 -1];
processes_struct(end).DefaultMachine = "electric_furnace";

% Crafting
processes_struct(end+1).Name = "copper_cable_crafting";
processes_struct(end).Period = 0.5;
processes_struct(end).ResourceNames = ["copper_cable" "copper_plate"];
processes_struct(end).ResourceValues = [2 -1];
processes_struct(end).DefaultMachine = "assembling_machine_3";

processes_struct(end+1).Name = "circuit_crafting";
processes_struct(end).Period = 0.5;
processes_struct(end).ResourceNames = ["electronic_circuit" "copper_cable" "iron_plate"];
processes_struct(end).ResourceValues = [1 -3 -1];
processes_struct(end).DefaultMachine = "assembling_machine_3";

processes_struct(end+1).Name = "iron_gear_wheel_crafting";
processes_struct(end).Period = 0.5;
processes_struct(end).ResourceNames = ["iron_gear_wheel" "iron_plate"];
processes_struct(end).ResourceValues = [1 -2];
processes_struct(end).DefaultMachine = "assembling_machine_3";

% Science
processes_struct(end+1).Name = "automation_science_pack_crafting";
processes_struct(end).Period = 5;
processes_struct(end).ResourceNames = ["automation_science_pack" "iron_gear_wheel" "copper_plate"];
processes_struct(end).ResourceValues = [1 -1 -1];
processes_struct(end).DefaultMachine = "assembling_machine_3";

% Transpose the array because I want it to be a "column vector"
processes_struct = processes_struct';

% Process unit rate matrix
% Each row defines an item, each column defines a process, and the value of
% each element is how much of that item is produced/consumed in a single
% iteration of the process.
A_unit = zeros(length(item_names),length(processes_struct));

% Process normalized rate matrix
% Each column defines how resources change per second if the process is run
% continuously
A = zeros(size(A_unit));

% Construct the process matrices from the struct array
for i = 1:length(processes_struct)
    proc = processes_struct(i);
    
    % Typo check
    [processes_struct(i).DefaultMachineIndex,~] = machine_names_to_indices(proc.DefaultMachine);
    

    % Find the row indices that are specified 
    [rows,~] = item_names_to_indices(proc.ResourceNames);
    % Column vector with a spot for each item
    unit_rate_vector = zeros(length(item_names),1); 
    % Slap those bad boys in there
    unit_rate_vector(rows) = proc.ResourceValues; % I think I should've transposed the vector to a column here but it's working fine for now
    % Construct the normalized version of the rate vector
    rate_vector = unit_rate_vector/proc.Period;
    A_unit(:,i) = unit_rate_vector;
    A(:,i) = rate_vector;
end

