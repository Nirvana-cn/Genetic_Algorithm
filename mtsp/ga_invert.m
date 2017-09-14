function [ race_new ] = ga_invert( race,P_Cross )
%倒序
%随机取两点，逆转两点之间的基因排列
k=race(1,1);
[m,n]=size(race);
race=race(1:m,2:n-1);
[m,n]=size(race);
race_new=race;
for i=1:m
    flag=rand;
    if(flag<P_Cross)
        temp=race_new(i,:);
        list=randperm(n);
        if(list(1)>list(2))
            start=list(2);
            finish=list(1);
        else
            start=list(1);
            finish=list(2);
        end
        temp_1=temp(1:1:start-1);
        temp_2=temp(finish:-1:start);
        temp_3=temp(finish+1:end);
        temp=[temp_1,temp_2,temp_3];
        race_new(i,:)=temp;
    end
end
race_new=[k*ones(m,1),race_new,k*ones(m,1)];
end

