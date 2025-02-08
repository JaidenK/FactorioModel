% Populates the workspace with machine_names
global machine_names crafting_speed_factor machine_operating_costs

machines_full = ...
{
    "burner_mining_drill"   0.25   new_rate_vector({"coal", -0.0225}) % Techincally it takes 90 kW "burnable fuel" not coal specifically but that's another level of the model to deal with later, if ever.
    "electric_mining_drill" 0.5    new_rate_vector({"electricity", -(90e3)})
    "big_mining_drill"      2.5    new_rate_vector({"electricity", -(300e3)})
    "offshore_pump"         1200   new_rate_vector() % Off-shore pump is FREE baby!
    "pumpjack"              1      new_rate_vector({"electricity", -(90e3)})
    "stone_furnace"         1      new_rate_vector({"coal", -0.0225}) % Techincally it takes 90 kW "burnable fuel" not coal specifically but that's another level of the model to deal with later, if ever.
    "steel_furnace"         2      new_rate_vector({"coal", -0.0225}) % Techincally it takes 90 kW "burnable fuel" not coal specifically but that's another level of the model to deal with later, if ever.
    "electric_furnace"      2      new_rate_vector({"electricity", -(180e3 + 6e3)})
    "foundry"               4      new_rate_vector({"electricity", -(2500e3 + 83.33e3)})
    "assembling_machine_1"  0.5    new_rate_vector({"electricity", -( 75e3 +  2.5e3)})
    "assembling_machine_2"  0.75   new_rate_vector({"electricity", -(150e3 +  5.0e3)})
    "assembling_machine_3"  1.25   new_rate_vector({"electricity", -(375e3 + 12.5e3)})
    "oil_refinery"          1      new_rate_vector({"electricity", -(420e3 + 14.0e3)})
    "chemical_plant"        1      new_rate_vector({"electricity", -(210e3 +  7.0e3)})
    "centrifuge"            1      new_rate_vector({"electricity", -(350e3 + 11.6e3)})
};

machine_names = [machines_full{:,1}]';
crafting_speed_factor = [machines_full{:,2}]';
machine_operating_costs = [machines_full{:,3}];

% This variable is just for constructing the others. Get rid of it to avoid
% cluttering the workspace.
clear machines_full
