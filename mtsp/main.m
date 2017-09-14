% 多旅行商问题的遗传算法
% 20个城市，2条线路
clear,clc
close all
load city_distance.mat
load city_location.mat
City_Number=21;         %城市数量
Race_Number=200;        %种群数量
Iteration=200;          %迭代次数
P_Cross=0.6;            %交叉概率
P_Mutation=0.2;         %变异概率
race=zeros(Race_Number,City_Number+2);

for i=1:Race_Number                         %初始化种群
    temp=randperm(City_Number);
    route=[City_Number+1,temp,City_Number+1];
    route=ga_hamilton(route);         %使用改良圈算法优化初始种群
    race(i,:)=route;
end
for t=1:Iteration
    adaptation=ga_adaptation(race);
    race=ga_choose(race,adaptation);
    race=ga_cross(race,P_Cross);
    race=ga_mutation(race,P_Mutation);
    race=ga_exchange(race,P_Cross);
    race=ga_invert(race,P_Cross);
    [path,val]=ga_plot(race);
    best_path=path;
    best_value=val;
    pause(0.1);
end

