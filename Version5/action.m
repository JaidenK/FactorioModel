classdef action    
    properties
        process % Process (object)
        cost_vector % Resource vector. One-time cost to start the action.
        machine % Machine (object)
        start_time % Time when action starts
        end_time   % Time when action stops
    end

    methods (Static)
        function obj = hand_action(proc,machine,start_time,quantity)
            duration = quantity*(proc.duration)/(machine.crafting_speed);
            obj = action(proc,0,machine,start_time,start_time+duration);
        end
    end
    
    methods
        function obj = action(process,cost_vector,machine,start_time,end_time)
            obj.process = process;
            obj.cost_vector = cost_vector;
            obj.machine = machine;
            obj.start_time = start_time;
            obj.end_time = end_time;
        end      


        function resource_vector = cost_func(obj,t)
            resource_vector = -utilities.step(t-obj.start_time)*obj.cost_vector;
        end

        function resource_vector = state_func(obj,t)
            resource_vector = (obj.machine.energy_rates + obj.process.rates.*obj.machine.crafting_speed).*(utilities.ramp(t-obj.start_time) - utilities.ramp(t-obj.end_time)) + obj.cost_func(t);
        end
    end
end

