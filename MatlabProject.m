clear
clc

num_points=inputdlg('How Many Points Do You Want?');
total_length=inputdlg('Total Length in KM?');
benchmark=inputdlg('The First Height (Benchmark)?');
num_points=str2double(num_points);
total_length=str2double(total_length);
benchmark=str2double(benchmark);
FS_height=input('Please Enter Your Heights For FS: \n');
BS_height=input('Please Enter Your Heights For BS: \n');
if size(FS_height,1)~=num_points || size(BS_height,1)~=num_points
    disp('Number of heights is not equal to the heights that you have entered!')
    return;
end
for i=1:num_points
    delta_h(i,1)=BS_height(i)-FS_height(i);
end
main_matrix=nan(num_points,5);
main_matrix(:,1)=FS_height;
main_matrix(:,2)=BS_height;
main_matrix(:,3)=delta_h;
for i=1:num_points
   if(main_matrix(i,3)>0)
       main_matrix(i,4)=main_matrix(i,3);
   elseif main_matrix(i,3)<0
       main_matrix(i,5)=main_matrix(i,3);
   elseif main_matrix(i,3)==0
       main_matrix(i,4)=main_matrix(i,3);
   end
end
disp(main_matrix);

e=sum(main_matrix(:,3));
e_max=12*(total_length*(10^(-3)))^0.5;
if e<e_max
c=-e/num_points;
for i=1:num_points
   c_matrix(i,1)=i-1; 
end
c_matrix=c*c_matrix;
new_H(1,1)=benchmark+main_matrix(1,3);
for i=1:num_points-1
    new_H(i+1,1)=new_H(i,1)+main_matrix(i+1,3);
end
new_H=[benchmark;new_H];
new_H(end)=[];
final_heights=new_H+c_matrix;
disp(final_heights);
elseif e>e_max
    disp('Error is too high! The Process can NOT be done!');    
end