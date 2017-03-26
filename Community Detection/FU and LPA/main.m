data = load('Dataset.mat');
data = data.Dataset ;
label = load('labels.mat');
label = label.labels ;
n = size(data,1);

for i = 1:n
    for j = 1:n
        if data(i,j) ~= data(j,i)
            data(i,j) = 1 ;
            data(j,i) = 1 ;
        end
    end
end

netplot(data); %�������ͼ������ֱ�۹۲�

[mod,s1] = fast_unfolding(data) ; %����fast_unfolding�㷨�����������s1��
[s2] = LPA(data) ; %����LPA�㷨�����������s2��
