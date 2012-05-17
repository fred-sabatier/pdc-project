function [observable] = extractObservableFromSignal(signal)
    LENGTH = Constants.FILE_LENGTH;
    RATE = Constants.RATE;
    BPS = Constants.BPS;
    SAMPLE_PER_BIT = RATE / BPS;
    
    soundSignal = createSoundSignal(1/BPS, Constants.FREQUENCY);

    observable = zeros(1, LENGTH);
    for i = 1:LENGTH
        signalPart = signal((i-1)*SAMPLE_PER_BIT + 1: i*SAMPLE_PER_BIT);
       
        % Two methods to get an observable...
%         observable(i) = mean(signalPart.*signalPart);
        observable(i) = max(xcorr(signalPart, soundSignal));
        
    end
end