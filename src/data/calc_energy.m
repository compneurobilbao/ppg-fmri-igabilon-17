function [ total_pow ] = calc_energy( values )
%CALC_ENERGY Summary of this function goes here
%   Detailed explanation goes here

F = fft(values);
pow = F.*conj(F);
total_pow = sum(pow);

end

