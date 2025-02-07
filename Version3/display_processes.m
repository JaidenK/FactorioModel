function display_processes(x)
%DISPLAY_PROCESSES Prints all non-zero entries of the Processes vector
%   Will automatically determine if x is the 1-dimensional vector (list of
%   unit-producers) or 2-dimensional matrix (matrix of specific machine
%   implementations)
global processes_struct machine_names
assert(isequal(size(x,1),size(processes_struct,1)),"Processes vector must have same number of rows as processes.");

if(size(x,2) == 1)
    [rows,~,values] = find(x);
    disp("Non-zero UNIT processes:");
    for i = 1:length(rows)
        %disp(processes_struct(rows(i)).Name + ": " + values(i));
        fprintf("%s\t%g\n",processes_struct(rows(i)).Name,values(i))
    end
else
    assert(size(x,2) == length(machine_names),"Invalid dimensons")
    [rows,cols,values] = find(x);
    disp("Non-zero processes:");
    for i = 1:length(rows)
        %disp(processes_struct(rows(i)).Name + ":" + machine_names(cols(i)) + ": " + values(i));
        fprintf("%s\t%s\t%g\n",processes_struct(rows(i)).Name,machine_names(cols(i)),values(i));
    end

end



end

