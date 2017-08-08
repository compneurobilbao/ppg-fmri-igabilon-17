function [ weights, p_values ] = linear_model(X, y)
%LINEAR_MODEL Summary of this function goes here
%   Detailed explanation goes here

[weigths,dev,stats] = glmfit(X',y');

% mdl = fitglm(X',y');

p_values = stats.p;

end

