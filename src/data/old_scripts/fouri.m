function fouri( data, Fs )
% Visualize the spectrum


if nargin<2 
    Fs=256;
end


T = 1/Fs;                     % Sample time
L = length(data);                     % Length of signal
t = (0:L-1)*T;                % Time vector

x = data(:,1);

figure
subplot(2,1,1)
plot(Fs*t,x)
title('Signal')
xlabel('time (milliseconds)')



NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(x,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
subplot(2,1,2)
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


end



