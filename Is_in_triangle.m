% function result=Is_in_triangle(p,a,b,c)
% 计算点是否位于三角形内的函数,p可为n*3矩阵，对应输出result为n维向量
function result=Is_in_triangle(p,a,b,c)
% 通过面积计算是否在三角形内
Sabc=0.5*sqrt(sum((cross(b-a,c-a,2).^2)')');
s1=0.5*sqrt(sum((cross(a-p,b-p,2).^2)')');
s2=0.5*sqrt(sum((cross(a-p,c-p,2).^2)')');
s3=0.5*sqrt(sum((cross(c-p,b-p,2).^2)')');
result = (abs(Sabc-s1-s2-s3)<=0.0001);
end