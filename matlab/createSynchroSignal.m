function [signal] = createSynchroSignal(RATE)
% Play two sounds 0.5 seconds, nRepet times

% TODO (later) find sequence which is not present in usual
% message (eg use other frequencies)

nRepet = 8;

s1 = createSoundSignal(1/nRepet, 440, RATE);
s2 = createSoundSignal(1/nRepet, 0, RATE); 
s = [s1 s2];

signal = zeros(1, 2*RATE); % Preallocation
for i = 0:nRepet-1
    disp(s)
    signal(i*RATE*2/nRepet+1:(i+1)*RATE*2/nRepet) = s;
end