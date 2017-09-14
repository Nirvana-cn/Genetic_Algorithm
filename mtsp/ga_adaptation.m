function [ adaptation ] = ga_adaptation( race )
    load city_distance.mat
    k=race(1,1);
    [m,n]=size(race);
    adaptation=zeros(1,m);
    adaptation_1=zeros(1,m);
    adaptation_2=zeros(1,m);
    for i=1:m
        path=0;
        for j=1:n-1
            path=path+city_distance(race(i,j),race(i,j+1));
        end
        path=path+city_distance(race(i,n),race(i,1));
        adaptation_1(i)=path;
        index=find(race(i,:)==k-1);
        adaptation_2(i)=max(index-1,n-index)*3000;  %系数3000不是一个固定的值，需要根据实际情况取值
        adaptation(i)=adaptation_1(i)+adaptation_2(i);
    end
end

