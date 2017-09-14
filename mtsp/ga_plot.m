function [ best_path,val ] = ga_plot( race )
    load city_location.mat
    [m,n]=size(race);
    point=zeros(n,2);
    adaptation=ga_adaptation(race);
    [val,index]=min(adaptation);
    best_path=race(index,:);
    for i=1:n
        point(i,:)=city_location(best_path(i),:);
    end
    plot(point(:,1),point(:,2),'-o');
end

