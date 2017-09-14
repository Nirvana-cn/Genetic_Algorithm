function [ race_new ] = ga_hamilton2( race )
%改良圈算法，输入一个种群，返回一个改良之后的种群
load city_distance.mat;
flag=0.7;
[m,n]=size(race);
race_new=race;
for k=1:m
    index=rand;
    if(index<flag)
        path_new=race_new(k,:);
        for i=2:n-2
            for j=i+1:n-1
                d1=city_distance(path_new(i-1),path_new(i))+city_distance(path_new(i),path_new(i+1));
                d2=city_distance(path_new(j-1),path_new(j))+city_distance(path_new(j),path_new(j+1));
                d3=city_distance(path_new(i-1),path_new(j))+city_distance(path_new(j),path_new(i+1));
                d4=city_distance(path_new(j-1),path_new(i))+city_distance(path_new(i),path_new(j+1));
                if((d1+d2)>(d3+d4))
                    temp=path_new(i);
                    path_new(i)=path_new(j);
                    path_new(j)=temp;
                end
            end
        end
        race_new(k,:)=path_new;
    end
end
end

