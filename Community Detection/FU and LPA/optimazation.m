function [ best_mod,new_data,s ] = optimazation( data )
%����ģ����Ż��ĺ���

n = size(data,1);
init_s = [1:n] ;
init_mod = modularity(data,init_s) ;
best_mod = init_mod ;
s = init_s ;
while(1)
    [mod,s] = modify(data,s) ; %����һ�θ���
    if(mod == best_mod) %��ģ����޷�������ʱ
        a = unique(s);
        b = numel(a) ;
        for i = 1:n
            pos = find(a==s(i)) ;
            s(i) = pos ;
        end
        break ;
    else
        best_mod = mod ; %�������ŵ�ģ���
    end
end
new_data = zeros(b) ;
for i = 1:b %�������ŵ��������ֽ��кϲ�
    for j = 1:b
        if(i~=j)
            tmp = data(s==i,s==j) ;
            new_data(i,j) = sum(sum(tmp))/2 ;    
        end
    end
end
end

