function [ pp_results ] = point_process( time_series )
%POINT_PROCCES Summary of this function goes here
%   Detailed explanation goes here

% Point process analysis for a signal. Values equal to 1 when the original value 
% is higher than the threshold (1*SD)
    th = std(time_series);

    pp_results = zeros(1, length(time_series));
    for i=1:length(time_series)
        pp_results(i) =  sum(time_series(:,i)> th(i));
    end
    
end

