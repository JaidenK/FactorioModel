classdef utilities
    methods(Static)
        function y = step(t)
            y = 1.*(t>zeros(size(t)));
        end
        function y = ramp(t)
            y = t.*(t>zeros(size(t)));
        end
    end
end

