% function result=Is_in_triangle(p,a,b,c)
% ������Ƿ�λ���������ڵĺ���,p��Ϊn*3���󣬶�Ӧ���resultΪnά����
function result=Is_in_triangle(p,a,b,c)
% ͨ����������Ƿ�����������
Sabc=0.5*sqrt(sum((cross(b-a,c-a,2).^2)')');
s1=0.5*sqrt(sum((cross(a-p,b-p,2).^2)')');
s2=0.5*sqrt(sum((cross(a-p,c-p,2).^2)')');
s3=0.5*sqrt(sum((cross(c-p,b-p,2).^2)')');
result = (abs(Sabc-s1-s2-s3)<=0.0001);
end