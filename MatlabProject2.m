clear
clc

num_points=inputdlg('How Many Points Do You Want?');
num_points=str2double(num_points);
angles=input('Enter Your Angles in GRAD: \n');
if size(angles,1)~=num_points
    disp('Number of Points That You have Enter is NOT the same as number of Angles!');
    return;
end
sum_angles=sum(angles);
exact_sum=(num_points-2)*200;
e=sum_angles-exact_sum;
e_max=2.5*0.0015*(num_points)^0.5;
if e<e_max
   c=-e/num_points;
   new_angles=angles+c;
   disp(new_angles);
else
    disp('Error is too high! Process can NOT be Done!')
end