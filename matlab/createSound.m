function x = createSound(duration, frequency, RATE)
% Computes a sampled signal

nSample = floor(RATE*duration);
n = 1:nSample;  

x = sin(2*pi*frequency*n/RATE);