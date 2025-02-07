% Populates the workspace with machine_names
global machine_names crafting_speed_factor

machines_full = ...
[
    "burner_mining_drill"   0.25
    "electric_mining_drill" 0.5
    "big_mining_drill"      2.5
    "offshore_pump"         1200
    "pumpjack"              1
    "stone_furnace"         1
    "steel_furnace"         2
    "electric_furnace"      2
    "foundry"               4
    "assembling_machine_1"  0.5
    "assembling_machine_2"  0.75
    "assembling_machine_3"  1.25
    "oil_refinery"          1
    "chemical_plant"        1
    "centrifuge"            1
];

machine_names = machines_full(:,1);
crafting_speed_factor = str2double(machines_full(:,2));


% This variable is just for constructing the others. Get rid of it to avoid
% cluttering the workspace.
clear machines_full
