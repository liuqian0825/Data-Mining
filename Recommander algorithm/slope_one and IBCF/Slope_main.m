clc;clear;
%train_small = load('train_small_2.txt');
train_small = load('train_small.txt');
%��ʼ�����ǵ����ݣ��õ�train_matrix��test_matrix��
[test_matrix,train_matrix] = initial(train_small);
%�õ�dev�����slope_data��������slope_data������1��Ϊitem_i��2��Ϊitem_j��3��Ϊuser��
[dev,slope_data] = get_dev_matrix(train_matrix);
%ͨ���õ���dev���󣬽������ݵĴ���
[score_matrix] = get_score(test_matrix,train_matrix,dev);
%�õ�RMES
[rmes] = get_RMES(score_matrix,test_matrix);
