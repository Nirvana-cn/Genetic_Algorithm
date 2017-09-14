function [ race_new ] = ga_select( race,adaptation )
    [m,n]=size(race);
    race_new=zeros(m,n);
    total=sum(adaptation);
    probability=zeros(1,m);
    wheel=zeros(1,m+1);
    for i=1:m
        probability(i)=adaptation(i)/total;
        if(i==1)
            wheel(i+1)=probability(i);
        else
            wheel(i+1)=wheel(i)+probability(i);
        end
    end
    for i=1:m
        temp=rand;
        for j=1:m
            if(temp>=wheel(j)&&temp<=wheel(j+1))
                race_new(i,:)=race(j,:);
            end
        end
    end
end

