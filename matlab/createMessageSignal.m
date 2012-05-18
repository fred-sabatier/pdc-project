function [signal] = createMessageSignal(message)
RATE = Constants.RATE;
BPS = Constants.BPS;
nSamplePerBit = RATE / BPS;

signal0 = createSoundSignal(1/BPS, 0);
signal1 = zeros(1, 4*nSamplePerBit);
signal1(1:1*nSamplePerBit) = createSoundSignal(1/BPS, Constants.FREQUENCY_440);
signal1(1*nSamplePerBit+1:2*nSamplePerBit) = createSoundSignal(1/BPS, Constants.FREQUENCY_500);
signal1(2*nSamplePerBit+1:3*nSamplePerBit) = createSoundSignal(1/BPS, Constants.FREQUENCY_600);
signal1(3*nSamplePerBit+1:4*nSamplePerBit) = createSoundSignal(1/BPS, Constants.FREQUENCY_700);

nBits = length(message);


signal = zeros(1, nBits * nSamplePerBit);

for i = 1:nBits
    % Set the signal part to signal0 or signal1
    if(message(i) == 0)
        signal((i-1)*nSamplePerBit + 1: i*nSamplePerBit) = signal0;
    else
        switch(mod(i,4))
            case 0
               signal((i-1)*nSamplePerBit + 1: i*nSamplePerBit) = signal1(1:1*nSamplePerBit);
            case 1
               signal((i-1)*nSamplePerBit + 1: i*nSamplePerBit) = signal1(1*nSamplePerBit+1:2*nSamplePerBit);
            case 2
               signal((i-1)*nSamplePerBit + 1: i*nSamplePerBit) = signal1(2*nSamplePerBit+1:3*nSamplePerBit);
            case 3
               signal((i-1)*nSamplePerBit + 1: i*nSamplePerBit) = signal1(3*nSamplePerBit+1:4*nSamplePerBit);
        end
    end
end

% plot(signal);