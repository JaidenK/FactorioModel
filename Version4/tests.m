clear all
close all
clc

resources;
machines;
processes;

% Tests of new_action function
a1 = new_action({ ...
    "stone_mining", "electric_mining_drill", 5 ...
})
a2 = new_action({ ...
    "stone_mining", "electric_mining_drill", 1;
    "circuit_crafting", "assembling_machine_3", 20;
})
sum_a1a2 = a1+a2