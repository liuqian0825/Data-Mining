function [test_matrix,train_matrix] = initial(train_small)
%��ʼ���������ǲ��õ���1/5��Ϊ���Լ����ܵ���ѵ������
[row,col] = size(train_small);
%�����ݱ�Ϊuser-items�ľ���
train_length = ceil(1*row/5);
for i=1: row
    train_matrix(train_small(i,1),train_small(i,2)) = train_small(i,3);
end
for i=1: train_length
    t = ceil(rand() * row);
    test_matrix(train_small(t,1),train_small(t,2)) = train_small(t,3);
end