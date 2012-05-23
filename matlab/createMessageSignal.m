function [signal] = createMessageSignal(message)
RATE = Constants.RATE;
SPS = Constants.SPS;
BPS = Constants.BPS;
FREQUENCY = Constants.FREQUENCY;
NBR_SYMBOLS = Constants.NBR_SYMBOLS;
nSamplePerSymbol = RATE / SPS;

% Allocate signal_ref
signal_ref = zeros(NBR_SYMBOLS, nSamplePerSymbol);

nBits = length(message);

for i = 1:NBR_SYMBOLS
    signal_ref(i,:) = createSoundSignal(1/SPS, FREQUENCY(i));
end

nBits = length(message);

signal = zeros(1, nBits*SPS/BPS * nSamplePerSymbol);

for i = 1:4:nBits
    % Set the signal part to signal0, signal1, signal2 or signal3
    
    l = (i-1)/4;
    
    ref = intmax('uint8');
    ref = 0;
    for j = 0:3
        if(message(i+j))
            ref = bitset(ref, 4-j);
        end
    end
    switch(ref)
        case 0
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(1,:);
        case 1
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(2,:);
        case 2
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(3,:);
        case 3
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(4,:);
        case 4
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(5,:);
        case 5
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(6,:);
        case 6
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(7,:);
        case 7
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(8,:);
        case 8
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(9,:);
        case 9
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(10,:);
        case 10
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(11,:);
        case 11
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(12,:);
        case 12
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(13,:);
        case 13
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(14,:);
        case 14
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(15,:);
        case 15
            signal(l*nSamplePerSymbol+1:(l+1)*nSamplePerSymbol) = signal_ref(16,:);
    end
end

plot(signal);