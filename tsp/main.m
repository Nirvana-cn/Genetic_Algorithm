% 单旅行商问题的遗传算法
% 20个城市，1条线路
clear,clc
close all
load city_distance.mat
load city_location.mat
City_Number=20;         %城市数量
Race_Number=200;        %种群数量
Iteration=100;          %迭代次数
P_Cross=0.8;            %交叉概率
P_Mutation=0.2;         %变异概率
race=zeros(Race_Number,City_Number+2);
%初始化种群
for i=1:Race_Number                         
    temp=randperm(City_Number);
    route=[City_Number+1,temp,City_Number+1];
    route=ga_hamilton(route);        %使用改良圈算法优化初始种群
    race(i,:)=route;
end
for t=1:Iteration
    adaptation=ga_adaptation(race);         %计算适应度大小
    race=ga_choose(race,adaptation);        %进行选择操作
    race=ga_cross(race,P_Cross);            %进行交叉操作
    race=ga_mutation(race,P_Mutation);      %进行变异操作
    [path,val]=ga_plot(race);
    pause(0.1);
    fprintf('第%d代,最优解为%d\n',t,val);
end
