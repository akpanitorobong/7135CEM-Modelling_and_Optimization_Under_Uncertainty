clc; clear; close all;

% Define benchmark functions
benchmark_functions = {@F1_shifted_sphere, @F2_shifted_rosenbrock, @F3_rotated_hybrid};
function_names = {'Shifted Sphere', 'Shifted Rosenbrock', 'Rotated Hybrid Composition'};
dimensions = [2, 10];
num_runs = 15;

% Initialize storage
results = [];

% Loop through functions and dimensions
for dim = dimensions
    for f = 1:length(benchmark_functions)
        func = benchmark_functions{f};
        func_name = function_names{f};
        
        % Store results for each algorithm
        for algo = {'GA', 'PSO', 'SA'}
            algo_name = algo{1};
            best_values = zeros(1, num_runs);
            
            % Perform multiple runs for statistical analysis
            for run = 1:num_runs
                switch algo_name
                    case 'GA'
                        best_values(run) = run_GA(func, dim); % Call GA optimizer
                    case 'PSO'
                        best_values(run) = run_PSO(func, dim); % Call PSO optimizer
                    case 'SA'
                        best_values(run) = run_SA(func, dim);  % Call SA optimizer
                end
            end
            
            % Compute statistics
            mean_val = mean(best_values);
            std_val = std(best_values);
            best_val = min(best_values);
            worst_val = max(best_values);
            
            % Store in results
            results = [results; {func_name, dim, algo_name, mean_val, std_val, best_val, worst_val}];
        end
    end
end

% Convert results to table
results_table = cell2table(results, 'VariableNames', {'Function', 'Dimensions', 'Algorithm', 'Mean', 'StdDev', 'Best', 'Worst'});

% Save to Excel file
filename = 'Optimization_Results Reloaded.xlsx';
writetable(results_table, filename, 'Sheet', 'Results');

disp(['Results saved to ', filename]);

%% ================== FUNCTION DEFINITIONS BELOW ==================

%% Benchmark Functions
function y = F1_shifted_sphere(x)
    o = ones(size(x));  % Shift vector (simplified, actual shift values needed)
    z = x - o;
    y = sum(z.^2);
end

function y = F2_shifted_rosenbrock(x)
    o = ones(size(x));  % Shift vector (simplified)
    z = x - o;
    y = sum(100 * (z(2:end) - z(1:end-1).^2).^2 + (z(1:end-1) - 1).^2);
end

function y = F3_rotated_hybrid(x)
    % Hybrid function requires specific weights and rotations
    % Here we use a simplified composite function
    y = F1_shifted_sphere(x) + F2_shifted_rosenbrock(x);
end

%% Genetic Algorithm (GA)
function best_value = run_GA(func, dim)
    options = optimoptions('ga', 'PopulationSize', 50, 'MaxGenerations', 100, 'Display', 'off');
    [x, fval] = ga(@(x) func(x), dim, [], [], [], [], -100 * ones(1, dim), 100 * ones(1, dim), [], options);
    best_value = fval;
end

%% Particle Swarm Optimization (PSO)
function best_value = run_PSO(func, dim)
    options = optimoptions('particleswarm', 'SwarmSize', 50, 'MaxIterations', 100, 'Display', 'off');
    [x, fval] = particleswarm(@(x) func(x), dim, -100 * ones(1, dim), 100 * ones(1, dim), options);
    best_value = fval;
end

%% Simulated Annealing (SA)
function best_value = run_SA(func, dim)
    options = optimoptions('simulannealbnd', 'MaxIterations', 100, 'Display', 'off');
    [x, fval] = simulannealbnd(@(x) func(x), zeros(1, dim), -100 * ones(1, dim), 100 * ones(1, dim), options);
    best_value = fval;
end
