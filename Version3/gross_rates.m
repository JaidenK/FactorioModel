function [a_gross] = gross_rates(A,x)
%GROSS_RATES Summary of this function goes here
%   Detailed explanation goes here
global processes_struct
assert(isequal(size(x),size(processes_struct)),"2D state matrix not supported.");
A = A.*(A>0); % surely it can't be this easy?
a_gross=A*x;
end

