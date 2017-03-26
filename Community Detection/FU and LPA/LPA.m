function [ s ] = LPA( data )

n = size(data,1);

t = 0 ;
T = 100 ;
s = [1:n] ; %��ʼÿ���ڵ㵥��Ϊһ������
while (t<T)
    t = t + 1 ;
    s_new = s ;
    for i = 1:n %����ÿһ���ڵ㣬�����ǩ��Ϊ�ڽ��ڵ��������Ǹ���ǩ
        pos = [i,find(data(i,:)==1)];
        a = unique(s(pos));
        max_num = 0 ;
        arr = [] ;
        for j = 1:size(a,2)
            num = size(find(s(pos)==a(j)),2) ;
            if(num > max_num)
                max_num = num ;
                arr = [a(j)] ;
            elseif(num == max_num)
                arr = [arr,a(j)] ;
            end
        end
        label = arr(unidrnd(max_num)) ; %��ǩ����ͬʱ�����ָ��һ����ǩ
        s_new(i) = label ;
    end
    s = s_new ;
    x = unique(s);
    y = numel(x) ;
    for i = 1:n
        pos = find(x==s(i)) ;
        s(i) = pos ;
    end
    cnt = 0 ;
    for i = 1:n % �ж϶���ÿһ���ڵ������������Ƿ����������ھӽڵ������ı�ǩ
        pos = [i,find(data(i,:)==1)];
        a = unique(s(pos));
        max_num2 = 0 ;
        max_label = -1 ;
        for j = 1:size(a,2)
            num = size(find(s(pos)==a(j)),2) ;
            if(num > max_num)
                max_num2 = num ;
                max_label = a(j) ;
            end
        end
        if(s(i)==max_label)
            cnt = cnt + 1 ;
        end
    end
    if(cnt == n)
        break ;
    end
end

end

