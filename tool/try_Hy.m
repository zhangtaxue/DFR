function [Hy_left, Hy_right, t1, t2] = try_Hy(pts_left, pts_right, ux, uy)
nums = size(pts_left,2);
A = zeros(nums,2);
b = zeros(nums,1);
h23 = 1;

for i = 1: nums
    A(i,:) = [-pts_right(1,i)*pts_left(2,i)-pts_right(2,i)*pts_left(1,i), pts_left(1,i)+pts_right(1,i)];
    b(i,:) = pts_right(2,i)-pts_left(2,i);
end
A_pinv = pinv(A);
H_params = A_pinv * b;
t1 = H_params(1);
t2 = H_params(2);

w = 2*ux;
h22 = ((4-w*w*t1*t1)/4)^(0.5);

Hy_left = [[1 0 0]; [h22*t2+h23*t1 h22 h23]; [t1/h22 0 1/h22]];
Hy_right = [[1 0 0]; [-h22*t2-h23*t1 h22 h23]; [-t1/h22 0 1/h22]];
end