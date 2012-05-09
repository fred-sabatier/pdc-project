function signal = createSoundSignal(duration, frequency, RATE)
% Computes a sampled signal

nSample = floor(RATE*duration);
n = 1:nSample;  

signal = sin(2*pi*frequency*n/RATE);