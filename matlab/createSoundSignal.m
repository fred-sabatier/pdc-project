function signal = createSoundSignal(duration, frequency)
% Computes a sampled signal
RATE = Constants.RATE;

nSample = floor(RATE*duration);
n = 1:nSample;  

signal = sin(2*pi*frequency*n/RATE);