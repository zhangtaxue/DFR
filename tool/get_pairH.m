function [H_2pt_left, H_2pt_right] = get_pairH(q_minus_left, q_minus_right, trials, samples, H,W)


% Hy
[Hy_2pt_left, Hy_2pt_right] = get_two_Hy(q_minus_left, q_minus_right, trials, samples, W/2, H/2);
H_2pt_left = Hy_2pt_left;
H_2pt_right = Hy_2pt_right;

% Hs
Hs_2pt_left = get_two_Hs(Hy_2pt_left, H, W);
Hs_2pt_right = get_two_Hs(Hy_2pt_right, H, W);


H_2pt_left = Hs_2pt_left*H_2pt_left;
H_2pt_right = Hs_2pt_right*H_2pt_right;



end