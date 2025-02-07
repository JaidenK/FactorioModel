function display_rates(a)
%DISPLAY_RATES Prints all non-zero (unbalanced) entries of the Rates vector
global item_names
assert(isequal(size(a),size(item_names)),"Rate vector must match dimensions of item names.");
[rows,~,values] = find(a);
disp("Non-zero rates:");
for i = 1:length(rows)
    disp(item_names(rows(i)) + ": " + values(i));
end
end

