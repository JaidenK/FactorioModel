classdef machine
    properties
        energy_rates % Resource rate vector
        crafting_speed % Scalar
    end
    
    methods
        function obj = machine(energy_rates,crafting_speed)
            obj.energy_rates = energy_rates;
            obj.crafting_speed = crafting_speed;
        end        
    end

    enumeration
        hand_crafting (0,1);
        hand_mining   (0,0.5);
        % 1 coal contains 4 MJ of energy for burners.
        % 1 Watt = 1 Joule/second.
        % 90 kW used by stone furnace
        stone_furnace (-((90e3)/(4e6))*(resource.coal.u), 1) 
    end
end

