function [in,all] = reflect(points,A,B,C)
% function [in,all] = reflect(points,A,B,C)
% ����[points,A,B,C]:points ΪA,B,C�������޶���������ƽ���ڵ����в���������ֵ(��֮ǰ�ɵ��������),A,B,C�޶���������ƽ��
% ����[in,all],inΪ�ܹ�������Դ�յĹ�����,allΪ�ܵķ��������(��������)
R = 300;
F = 0.466*R;
% ����ƽ�淨����
n = cross((A-B),(B-C));
% ȡƽ�泯��Ϊ��ȷ
if(n(3)<0)
    n = -n;
end
n = n/norm(n);
% ��һ��������
% ���ݽ������ʽ�������������(a,b,c)
a = 2*n(1)*n(3);
b = 2*n(2)*n(3);
c = n(3).^2-n(1).^2-n(2).^2;
t = (F - R - points(:,3))/c;
x = points(:,1)+a*t;
y = points(:,2)+b*t;
[all,~] = size(points);
in = sum(x.^2+y.^2<=0.5^2);
end
