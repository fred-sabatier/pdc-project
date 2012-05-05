function [signal] = createMessageSignal(message, RATE, BIT_PER_SEC)

signal0 = createSound(1/BIT_PER_SEC, 0, RATE);
signal1 = createSound(1/BIT_PER_SEC, 880, RATE);

nBits = length(message);
nSamplePerBit = RATE / BIT_PER_SEC;

signal = zeros(1, nBits * nSamplePerBit);

for i = 1:nBits
    % Set the signal part to signal0 or signal1
    if(message(i) == 0)
        signal((i-1)*nSamplePerBit + 1: i*nSamplePerBit) = signal0;
    else
        signal((i-1)*nSamplePerBit + 1: i*nSamplePerBit) = signal1;
    end
end

% plot(signal);