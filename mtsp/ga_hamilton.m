function [ path_new ] = ga_hamilton( path )
%改良圈算法，输入一条路径，返回一条改良之后的路径
load city_distance.mat;
len=length(path);
path_new=path;
for i=3:len-3
    for j=i+1:len-2
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
end

