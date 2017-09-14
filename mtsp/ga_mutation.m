function [ race_new ] = ga_mutation( race,P_Mutation )
%变异
%随机取两点，交换两点基因型
k=race(1,1);
[m,n]=size(race);
race=race(1:m,2:n-1);
[m,n]=size(race);
race_new=race;
for i=1:m
    flag=rand;
    if(flag<=P_Mutation)
        list=randperm(n);
        temp=race_new(i,list(1));
        race_new(i,list(1))=race_new(i,list(2));
        race_new(i,list(2))=temp;
    end
end
race_new=[k*ones(m,1),race_new,k*ones(m,1)];
end

