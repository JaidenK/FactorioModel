classdef resource
    properties
        Name % name string
        u    % Unit vector
    end
    
    methods
        function obj = resource(Name,unit_vector)
            obj.Name = Name;
            obj.u = unit_vector;
        end        
    end

    enumeration
        stone         ("Stone",         [1 0 0 0 0])
        stone_furnace ("Stone Furnace", [0 1 0 0 0])
        coal          ("Coal",          [0 0 1 0 0])
        iron_ore      ("Iron Ore",      [0 0 0 1 0])
        iron_plate    ("Iron Plate",    [0 0 0 0 1])
    end
end

