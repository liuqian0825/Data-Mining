%close all;clc;clear;
K = 2;%����ĸ���
load('ringData.mat');%��������ringData
%load('GaussianData.mat');%��������GuassianData
%�ҵ����ݼ��еķֺõ�������ĵľ����Լ�ÿ������������ࡣ
[cluster_distance,cent_of_clustering] = my_kmeans(Dataset,K);
%ͨ���õ������ݣ����л��֣��õ����յ�ͼ��
draw_picture(cluster_distance,cent_of_clustering,Dataset,K);