function [q_new_left, q_new_right] = point_mapping(H_left, H_right, q_left, q_right)
q_new_left = H_left * q_left;
q_new_right = H_right * q_right;
q_new_left = q_new_left(1:3,:)./q_new_left(3,:);
q_new_right = q_new_right(1:3,:)./q_new_right(3,:);
end