function [ race_new ] = ga_choose( race,adaptation )
%精英选择策略
%随机取种群的1/10，保留最优值，循环m次，competition_number可根据需要调整
[m,n]=size(race);
race_new=zeros(m,n);
competition_number=floor(m/10);
for i=1:m
    competition=zeros(1,competition_number);
    temp=randperm(m);
    for j=1:competition_number
        competition(1,j)=adaptation(temp(j));
    end
    [val,index]=min(competition);
    race_new(i,:)=race(temp(index),:);
end
end

