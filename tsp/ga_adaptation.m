function [ adaptation ] = ga_adaptation( race )
    load city_distance.mat
    [m,n]=size(race);
    adaptation=zeros(1,m);
    for i=1:m
        path=0;
        for j=1:n-1
            path=path+city_distance(race(i,j),race(i,j+1));
        end
        path=path+city_distance(race(i,n),race(i,1));
        adaptation(i)=path;
    end
end

