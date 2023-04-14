clear all;
clc;
addPaths();

% 读取图片
left_image_name = 'E:\graduate_program\DFR\code\DFR\test_picture\street1.jpg';
right_image_name = 'E:\graduate_program\DFR\code\DFR\test_picture\street2.jpg';

left_image = imread(left_image_name);
right_image = imread(right_image_name);

height = size(left_image,1);
width  = size(left_image,2);

%Feature point matching
fprintf('Feature point matching\n');
[ml,mr,~]= sift_match_pair(left_image,right_image,'F');

% find the homography matrix
fprintf('Obtain the homography matrix\n');
[q_change_left,q_change_right] = change_ux_uy(ml, mr, width/2, height/2, true);
trials = 200;
samples = 20;
[H_2pt_left, H_2pt_right] = get_pairH(q_change_left, q_change_right, trials, samples,height,width);


%correct pictures

I1 = left_image;
I2 = right_image;
[I1r,I2r, bb1, bb2] = correct_the_picture(I1(:,:,1),I2(:,:,1),H_2pt_left,H_2pt_right,'valid');
[I1r(:,:,2), I2r(:,:,2), ~] = correct_the_picture(I1(:,:,2),I2(:,:,2),H_2pt_left,H_2pt_right,'valid');
[I1r(:,:,3), I2r(:,:,3), ~] = correct_the_picture(I1(:,:,3),I2(:,:,3),H_2pt_left,H_2pt_right,'valid');
I1r = uint8(I1r);
I2r = uint8(I2r);
figure;imshow(I1r,[]);
figure;imshow(I2r, []);