fprintf(" --- Model Input --- \n");
fprintf("\n");

disp("Target Production Rates:");
display_rates(b);
fprintf("\n");

disp("Resource Scope:")
if(exist('resource_scope','var'))
    disp(resource_scope);
else
    disp("(All resources)");
end
fprintf("\n");

disp("Process Scope:")
if(exist('process_scope','var'))
    disp(process_scope);
else
    disp("(All processes)");
end
fprintf("\n");

fprintf(" --- Model Results --- \n");
fprintf("\n");
disp("Net Production Rates:");
display_rates(Ax);
fprintf("\n");

disp("Gross Production Rates:");
display_rates(Ax_gross);
fprintf("\n");

% For belt requirements analysis:
disp("Belt Requirements (Yellow Belt):");
yellow_belt_capacity = 15;
display_rates(Ax_gross/yellow_belt_capacity);
fprintf("Note: Belt requirements depend on specific implementation details.\n");
fprintf("\n");

% Process Analysis
fprintf("Unit Process Analysis:\n");
display_processes(x);
fprintf("\n");

fprintf("Construction Suggestion:\n");
display_processes(x2);
fprintf("\n");

fprintf("Machine Summary:\n");
x_machines = x2'*ones(size(x2,1),1);
display_machines(x_machines);
fprintf("\n");

fprintf("Cost Summary:\n");
display_rates(machine_operating_costs * x_machines);
fprintf("\n");