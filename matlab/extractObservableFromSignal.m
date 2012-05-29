function [observable] = extractObservableFromSignal(signal)
    LENGTH = Constants.FILE_LENGTH;
    RATE = Constants.RATE;
    BPS = Constants.BPS;
    SAMPLE_PER_BIT = RATE / BPS;
    
    soundSignal0 = createSoundSignal(1/BPS, Constants.FREQUENCY_0);
    soundSignal1 = createSoundSignal(1/BPS, Constants.FREQUENCY_1);

    observable = zeros(1, LENGTH);
    for i = 1:LENGTH
        signalPart = signal((i-1)*SAMPLE_PER_BIT + 1: i*SAMPLE_PER_BIT);
       
        % Two methods to get an observable...
%         observable(i) = mean(signalPart.*signalPart);
        observable_0 = max(xcorr(signalPart, soundSignal0));
        observable_1 = max(xcorr(signalPart, soundSignal1));
        
        if(observable_0 > observable_1)
            observable(i) = 0;
        else
            observable(i) = 1;
        end
    end
end