clc;clear;
%train_small = load('train_small_2.txt');
train_small = load('train_small.txt');
number = 5;
%��ʼ�����ǵ����ݣ��õ�train_matrix��test_matrix��
[test_matrix,train_matrix] = initial(train_small);
%��������Ծ���sim
[sim] = get_sim_matrix(train_matrix);
%�ҵ�test_matrix�е����ݣ����Һ�sim�����е����ݽ��бȽϣ��ҵ���������û���Ԥ����ֵ��
[score_matrix] = get_score_matrix(test_matrix,train_matrix,sim,number);
%�õ�RMES
[rmes] = get_RMES(score_matrix,test_matrix);