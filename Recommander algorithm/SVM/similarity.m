function [ sim ] = similarity( x , y )
%���ƶȼ��㺯����ʹ�õ���������Ӧ�Թ�ʽ

x = x - mean(x) ;
y = y - mean(y) ;

sim = (x*y')/(norm(x)*norm(y)) ;

end
