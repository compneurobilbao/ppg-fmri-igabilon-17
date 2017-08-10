function [ brain_result_pval ] = generate_map( X, y )
%GENERATE_MAP Summary of this function goes here
%   Detailed explanation goes here

%correlation
[brain_result,pval] = corr(X',y');
brain_result_pval = brain_result;
brain_result_pval(pval>0.05) = 0;

end

