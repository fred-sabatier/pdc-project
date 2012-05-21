function [signal] = createMessageSignal(message)
RATE = Constants.RATE;
SPS = Constants.SPS;
BPS = Constants.BPS;
nSamplePerSymbol = RATE / SPS;

signal0 = zeros(1, nSamplePerSymbol);
signal1 = zeros(1, nSamplePerSymbol);
signal2 = zeros(1, nSamplePerSymbol);
signal3 = zeros(1, nSamplePerSymbol);
signal0 = createSoundSignal(1/SPS, 400);
signal1 = createSoundSignal(1/SPS, 450);
signal2 = createSoundSignal(1/SPS, 500);
signal3 = createSoundSignal(1/SPS, 550);

nBits = length(message);

signal = zeros(1, nBits*SPS/BPS * nSamplePerSymbol);

for i = 1:2:nBits
    % Set the signal part to signal0, signal1, signal2 or signal3
    
    l = (i-1)/2;
    
    if(message(i) == 0 && message(i+1) == 0)
        signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal0;
    elseif(message(i) == 0 && message(i+1) == 1)
        signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal1;
    elseif(message(i) == 1 && message(i+1) == 0)
        signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal2;
    else
        signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal3;
    end
end

plot(signal);