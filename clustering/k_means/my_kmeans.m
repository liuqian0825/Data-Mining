function  [cluster_distance,cent_of_clustering] = my_kmeans(Dataset,K)
[row,col] = size(Dataset);
% �洢����
cent_of_clustering = zeros(K,col);%censet��Ϊ�������ĵ�ľ���

% �����ʼ������
for i= 1:col
    minV = min(Dataset(:,i));
    rangV = max(Dataset(:,i)) - minV;
    cent_of_clustering(:,i) = repmat(minV,[K,1]) + rangV*rand(K,1);
end

% ���ڴ洢ÿ���㱻�����cluster�Լ������ĵľ���
cluster_distance = zeros(row,2);%��������ÿ���㵽���ĵ�ľ��룬������������ڵ��ࡣ
cluster_Change = true;%�����������ĵ��Ƿ�ı�
%���ÿ����������ĵľ��룬Ȼ����࣬���Ͻ���ѭ����ֱ���ȶ���
while cluster_Change
    cluster_Change = false;
    % ����ÿ����Ӧ�ñ������cluster
    for i = 1:row
        minDist = 10000;
        minIndex = 0;
        for j = 1:K
            distCal = sqrt(sum(power((Dataset(i,:) - cent_of_clustering(j,:)),2)));%����������֮���ŷʽ���롣
            %�ҵ���С�ľ��룬������±�
            if (distCal < minDist)
                minDist = distCal;
                minIndex = j;
            end
        end
        %��ÿһ��������жϣ�������һ���Ƿ���ͬһ�����У����ȫ��һ�£�������ȶ���
        if minIndex ~= cluster_distance(i,1)            
            cluster_Change = true;
        end
        %�����ݽ�����Ļ��֣�����ס���롣
        cluster_distance(i,1) = minIndex;
        cluster_distance(i,2) = minDist;
    end

    % ����ÿ��cluster ������
    for j = 1:K
        %�ҵ�cluster_distance����j��һ��ĵ㡣
        simpleCluster = find(cluster_distance(:,1) == j);
        %�����Щ��ľ�ֵ����Ϊ���ǵ�������ġ�
        cent_of_clustering(j,:) = mean(Dataset(simpleCluster',:));
    end

end