function [signal] = createSynchroSignal(RATE)
% Play two sounds 0.5 seconds, nRepet times

% TODO (later) find sequence which is not present in usual
% message (eg use other frequencies)

nRepet = 2;

s1 = createSound(0.5, 440, RATE);
s2 = createSound(0.5, 0, RATE); 
s = [s1 s2];

signal = zeros(1, nRepet*RATE); % Preallocation
for i = 0:nRepet-1
    signal(i*RATE+1:(i+1)*RATE) = s;
end