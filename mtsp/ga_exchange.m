function [ race_new ] = ga_exchange( race,P_Cross )
%ga_exchange实现随机取某一基因点，交换该点和紧跟后面一点的基因型
k=race(1,1);
[m,n]=size(race);
race=race(1:m,2:n-1);
[m,n]=size(race);
race_new=race;
for i=1:m
    flag=rand;
    if(flag<P_Cross)
      list=randperm(n-1);
      temp=race_new(i,list(1));
      race_new(i,list(1))=race_new(i,list(1)+1);
      race_new(i,list(1)+1)=temp;
    end
end
race_new=[k*ones(m,1),race_new,k*ones(m,1)];
end

