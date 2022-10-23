clear all
clc
global EFFI
options = optimoptions('particleswarm','SwarmSize',15,'MaxIterations',16);
fun=@effnaca;
[r,fval,exitflag,output] = particleswarm(fun,3,[0.08,0,0.2],[0.25,0.095,0.5],options)