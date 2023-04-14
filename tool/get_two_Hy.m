function [Hy_left, Hy_right] = get_two_Hy(q_left, q_right, trials, samples, ux, uy)

eps = 0.5;

ptNum = size(q_left, 2);
best_Hy_left = eye(3);
best_Hy_right = eye(3);
min_vertical_error = inf;

%RANSAC process
for i = 1: trials
    ran_samples_idx = randperm(ptNum,samples);    %Randomly pick a certain number of feature points
    ran_samples_left = q_left(:,ran_samples_idx);
    ran_samples_right = q_right(:,ran_samples_idx);
    
    % Calculate the matrix obtained by sampling
    [try_Hy_left, try_Hy_right] = try_Hy(ran_samples_left,ran_samples_right, ux, uy);


    [q_2pt_left, q_2pt_right] = point_mapping(try_Hy_left, try_Hy_right, q_left, q_right);
    error_y = abs(q_2pt_left(2, :) - q_2pt_right(2, :));
    lower_mat = error_y < eps;
    vertical_error = sum(error_y(1, lower_mat))/size(error_y(1, lower_mat),2);


    if vertical_error < min_vertical_error
        best_error_y = error_y;
        min_vertical_error = vertical_error;
        best_Hy_left = try_Hy_left;
        best_Hy_right = try_Hy_right;
    end


end

lower_mat = best_error_y < eps;
ran_samples_left = q_left(:, lower_mat);
ran_samples_right = q_right(:, lower_mat);
[best_Hy_left, best_Hy_right] = try_Hy(ran_samples_left,ran_samples_right, ux, uy);

Hy_left = best_Hy_left;
Hy_right = best_Hy_right;

end
