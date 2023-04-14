function [q_change_left,q_change_right] = change_ux_uy(q_left, q_right, ux, uy, plus_or_minus)
ptNum = size(q_left,2);
q_change_left = ones(3, ptNum);
q_change_right = ones(3, ptNum);
if plus_or_minus == true
    q_change_left(1,:) = q_left(1, :)-ux;
    q_change_left(2,:) = q_left(2, :)-uy;
    q_change_right(1,:) = q_right(1,:)-ux;
    q_change_right(2,:) = q_right(2,:)-uy;
else
    q_change_left(1,:) = q_left(1, :)+ux;
    q_change_left(2,:) = q_left(2, :)+uy;
    q_change_right(1,:) = q_right(1,:)+ux;
    q_change_right(2,:) = q_right(2,:)+uy;
end