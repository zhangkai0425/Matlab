function [in,all] = reflect(points,A,B,C)
% function [in,all] = reflect(points,A,B,C)
% 输入[points,A,B,C]:points 为A,B,C三点所限定的三角形平板内的所有采样点坐标值(由之前采点程序生成),A,B,C限定了三角形平面
% 返回[in,all],in为能够进入馈源舱的光线数,all为总的反射光线数(采样点数)
R = 300;
F = 0.466*R;
% 计算平面法向量
n = cross((A-B),(B-C));
% 取平面朝上为正确
if(n(3)<0)
    n = -n;
end
n = n/norm(n);
% 归一化法向量
% 根据解析表达式计算出反射向量(a,b,c)
a = 2*n(1)*n(3);
b = 2*n(2)*n(3);
c = n(3).^2-n(1).^2-n(2).^2;
t = (F - R - points(:,3))/c;
x = points(:,1)+a*t;
y = points(:,2)+b*t;
[all,~] = size(points);
in = sum(x.^2+y.^2<=0.5^2);
end
