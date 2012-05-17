function [signal] = createMessageSignal(message)
RATE = Constants.RATE;
BPS = Constants.BPS;

signal0 = createSoundSignal(1/BPS, 0);
signal1 = createSoundSignal(1/BPS, Constants.FREQUENCY);

nBits = length(message);
nSamplePerBit = RATE / BPS;

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