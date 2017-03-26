function draw_picture(cluster_distance,cent_of_clustering,Dataset,K)
%��ͼ
[row ,col] = size(Dataset);
figure
%����ÿ���صĵ㡣
for i = 1:K
    pointCluster = find(cluster_distance(:,1) == i);
    [row_,col_] = size(pointCluster);
    fprintf('this is %d cluster, and there are %d values, the propority of %f\n',i,row_,row_/row);
    scatter(Dataset(pointCluster,1),Dataset(pointCluster,2),10);
    hold on
end
%hold on
%������
scatter(cent_of_clustering(:,1),cent_of_clustering(:,2),300,'+')
hold off