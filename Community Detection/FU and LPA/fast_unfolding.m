function [ best_mod,s ] = fast_unfolding( data )

[best_mod,new_data,s] = optimazation(data);
while(1)
    [new_mod,new_data,new_s] = optimazation(new_data); %����һ�ε����Ż�
    if new_mod > best_mod   %����ֱ��ģ����޷��ٴ�����
        best_mod = new_mod ;
        a = unique(new_s);
        b = numel(a) ;
        for i = 1:b
            s(s==i) = new_s(i) ;
        end
    else
        break ;
    end
end

end

