function [message] = extractMessageFromSignal(signal, RATE, BIT_PER_SEC, LENGTH)
SAMPLE_PER_BIT = RATE / BIT_PER_SEC;
ENERGY_LIMIT = 0.01; % TODO choose during synchro?

% disp(length(signal))
% disp(SAMPLE_PER_BIT)

message = zeros(1, LENGTH);
for i = 1:LENGTH
    bitSignal = signal((i-1)*SAMPLE_PER_BIT + 1: i*SAMPLE_PER_BIT);
    energy = mean(bitSignal.*bitSignal);
%     disp(energy); 
    if(energy > ENERGY_LIMIT)
        message(i) = 1;
    else
        message(i) = 0;
    end
end