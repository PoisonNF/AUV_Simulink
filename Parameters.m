clear

%{
m = 100;     %质量为10kg
Ixx = 6.10; %机身x轴转动惯量
Iyy = 5.98; %机身y轴转动惯量
Izz = 9.1;  %机身z轴转动惯量
%}

m = 35.135;    %质量为10kg
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


%水动力系统
Xu_dot = -0.0524;
Xu = -0.0451;
Xuu = -0.1167;

Yv_dot = -0.0524;
Yv = -0.0451;
Yvv = -3.43*1e-3;

Zw_dot = -0.5185;
Zw = -1.2653;
Zww = -0.6120;

Kp_dot = -0.0537;
Kp = 0.0707;
Kpp = 1.19*1e-2;

Mq_dot = -0.0261;
Mq = -0.0335;
Mqq = 8.3*1e-3;

Nr_dot = 3.9109*1e-4;
Nr = 5.5785*1e-3;
Nrr = 5.53*1e-5;


%控制器调参
C1 = 100; 
epsi = 0.1;
lambda_dot=100;