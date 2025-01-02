function [x, y, phi_rad] = solve_with_heading(u_x, u_y, psi_cur_rad)
    % 输入: u_x, u_y, phi_cur
    % 输出: x, y, phi，使 abs(x)+abs(y) 最小
    
    % 构造系数矩阵
    % 方程形式: [cos(phi), -sin(phi)] * [x; y] = u_x
    %           [sin(phi),  cos(phi)] * [x; y] = u_y
    % 遍历psi_cur_rad左右两边的角度，使用广义逆矩阵法，寻找abs(x)+abs(y) 最小

    max_tao = inf;      %x和y的绝对值之和
    x_temp = 0;         %x的暂存
    y_temp = 0;         %y的暂存
    psi_temp = 0;       %psi弧度的暂存

    % 初始 psi_cur_ang 为 psi_cur_rad转化为角度
    psi_cur_ang = psi_cur_rad*180/pi;        %当前航向角弧度转化为角度

    %遍历当前航向角左右各20度，寻找一个最合适的新航向角
    for phi_ang = psi_cur_ang-20 : psi_cur_ang+20
        % 构造当前 phi 下的系数矩阵
        A = [cos(phi_ang*pi/180), -sin(phi_ang*pi/180); sin(phi_ang*pi/180), cos(phi_ang*pi/180)];
        b = [u_x; u_y];

        % 求解最小范数解
        solution = pinv(A) * b;
        x = solution(1);
        y = solution(2);

        % 更新 phi，目标是最小化 phi 偏差
        abs_x_y_sum=abs(x)+abs(y);      %计算abs(x)+abs(y)

        % abs(x)+abs(y)为历史最小，收集本组数据
        if abs_x_y_sum < max_tao
            max_tao = abs_x_y_sum;
            x_temp = x;
            y_temp = y;
            psi_temp = phi_ang/180*pi;

            %fprintf('x = %.4f, y = %.4f,x+y = %.4f phi = %.4f\n', x, y,tao_abs_x_y, phi_temp*180/pi);

        end
        %fprintf('count = %.4f\n',phi);     %查看轮数
    end

    %最终得到的最适合的组合
    x = x_temp;
    y = y_temp;
    phi_rad = psi_temp;

end
