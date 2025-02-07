% Populates the workspace with item_names
global item_names

% Definitions for resources for Factorio. These represent items and fluids.
% Things that can show up on belts, in chests, etc. They do NOT represent
% the processes used to create them and do not represent the machines
% placed on the map tiles. i.e. if an assembler is in a chest it's
% represetned here, but when that assembler is placed on the map it's
% represented by a machine.

item_names = ...
[
    % Resources
    "wood"
    "coal"
    "stone"
    "iron_ore"
    "copper_ore"
    "uranium_ore"
    "raw_fish"
    "ice"

    % Materials
    "iron_plate"
    "copper_plate"
    "steel_plate"
    "solid_fuel"
    "plastic_bar"
    "sulfur"
    "battery"
    "explosives"
    "carbon"

    % Crafting Components
    "iron_gear_wheel"
    "iron_stick"
    "copper_cable"
    "electronic_circuit"
];
