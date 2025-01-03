% 提取工作区数据
t = out.t;          % 仿真时间
x_d = out.x_d;      % 预计轨迹 - X 数据
y_d = out.y_d;      % 预计轨迹 - Y 数据
z_d = out.z_d;      % 预计轨迹 - Z 数据

x_act = out.x_act;  % 实际轨迹 - X 数据
y_act = out.y_act;  % 实际轨迹 - Y 数据
z_act = out.z_act;  % 实际轨迹 - Z 数据

% 创建三维轨迹图
figure;

% 绘制预计轨迹
plot3(x_d, y_d, z_d, 'r-', 'LineWidth', 1.5); % 红色线条代表预计轨迹
hold on;

% 绘制实际轨迹
plot3(x_act, y_act, z_act, 'b--', 'LineWidth', 1.5); % 蓝色虚线代表实际轨迹

% 添加图例和样式
grid on; % 显示网格
xlabel('X方向'); % X轴标签
ylabel('Y方向'); % Y轴标签
zlabel('Z方向'); % Z轴标签
title('轨迹跟踪效果'); % 标题
legend('预计轨迹', '实际轨迹', 'Location', 'best'); % 图例
hold off;
