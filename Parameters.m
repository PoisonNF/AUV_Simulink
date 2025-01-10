clear

%{
m = 100;     %质量为10kg
Ixx = 6.10; %机身x轴转动惯量
Iyy = 5.98; %机身y轴转动惯量
Izz = 9.1;  %机身z轴转动惯量
%}

m = 32.135;    %质量为10kg
Ixx = 1.4676;  %机身x轴转动惯量
Iyy = 1.4676;  %机身y轴转动惯量
Izz = 2.4720;  %机身z轴转动惯量

xh=0.4;     %x轴力臂
yh=0.4;     %y轴力臂
zh=0;       %z轴力臂
%{
SW的坐标轴和普通的不一样，Y朝上
装配体1 的质量属性
     配置： 默认
     坐标系： -- 默认 --

* 含有一个或多个隐藏零部件/实体的质量属性。

质量 = 32.135 千克

体积 = 33599569.969 立方毫米

表面积 = 5527538.683  平方毫米

重心 : ( 毫米 )
	X = 3.942
	Y = 26.556
	Z = 3.941

惯性主轴和惯性主力矩: ( 千克 *  平方毫米 )
由重心决定。
	 Ix = ( 0.707,  0.000, -0.707)   	Px = 1384409.459
	 Iy = (-0.707, -0.003, -0.707)   	Py = 1504579.454
	 Iz = (-0.002,  1.000, -0.002)   	Pz = 2471073.407

惯性张量: ( 千克 *  平方毫米 )
由重心决定，并且对齐输出的坐标系。 （使用正张量记数法。）
	Lxx = 1444494.726	Lxy = 2261.822	Lxz = -60090.172
	Lyx = 2261.822	Lyy = 2471063.054	Lyz = 2211.339
	Lzx = -60090.172	Lzy = 2211.339	Lzz = 1444504.540

惯性张量: ( 千克 *  平方毫米 )
由输出座标系决定。 （使用正张量记数法。）
	Ixx = 1467656.991	Ixy = 5625.578	Ixz = -59590.923
	Iyx = 5625.578	Iyy = 2472061.553	Iyz = 5574.990
	Izx = -59590.923	Izy = 5574.990	Izz = 1467666.836
%}

%%
%方形
desired_pos_series = [
0,0,0,0;           
0,0,5,0;
           5,0,5,0;
           5,5,5,0;
           0,5,5,0;
           0,0,5,0];%期望路径x,y,z(z是正的表示高度,到后面应该乘个负号)
desired = desired_pos_series;
hold on
grid on
figure(1)
plot3(desired_pos_series(:,1),desired_pos_series(:,2),desired_pos_series(:,3),'-r');
xlabel('x');
ylabel('y');
zlabel('z');
title("方型轨迹仿真结果");
xlim([-3,8]);
ylim([-3,8]);
zlim([0,8]);


%%
%圆形
%确定航轨点数目
num_points =100;
heigh = 3;%设置高度
%预先生成储存x、y位置的向量
x = zeros(num_points,1);
y = zeros(num_points,1);
z = ones(num_points,1);
%存储期望的轨迹点
desired = zeros(num_points+2,4);
desired_pos_series = zeros(num_points+2,3);
desired_yaw = zeros(num_points+1,1);
desired_pos_series(1,:)=[0,0,0];
desired_pos_series(2,:)=[0,0,heigh];
%生成轨迹点
for i = 1:num_points
    x(i) = 10*cos(2*pi*i/num_points);
    y(i) = 10*sin(2*pi*i/num_points);
end
%给轨迹点赋值
desired_pos_series(3:end,1) = x(:,1);
desired_pos_series(3:end,2) = y(:,1);
desired_pos_series(3:end,3) = z(:,1)*heigh;
desired(:,1:3) = desired_pos_series(:,:);
desired(2:end,4) = desired_yaw;
hold on
grid on
figure(1)
plot3(desired_pos_series(:,1),desired_pos_series(:,2),desired_pos_series(:,3),'-r');
xlabel('x');
ylabel('y');
zlabel('z');
title("圆形轨迹仿真结果");
xlim([-15,15]);
ylim([-15,15]);
zlim([0,5]);

%%
%梳状面
desired_pos_series = [
0,0,0,0;           
0,0,3,0;
           5,0,3,0;
           5,1,3,0;
           0,1,3,0;
           0,2,3,0;
           5,2,3,0;
           5,3,3,0;
           0,3,3,0;
           0,4,3,0;
           5,4,3,0;
           5,5,3,0;
           ];%期望路径x,y,z(z是正的表示高度,到后面应该乘个负号)
desired = desired_pos_series;
hold on
grid on
figure(1)
plot3(desired_pos_series(:,1),desired_pos_series(:,2),desired_pos_series(:,3),'-r');
xlabel('x');
ylabel('y');
zlabel('z');
title("方型轨迹仿真结果");
xlim([-3,8]);
ylim([-3,8]);
zlim([0,8]);