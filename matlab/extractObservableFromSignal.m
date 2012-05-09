function [observable] = extractObservableFromSignal(signal, RATE, BIT_PER_SEC, LENGTH)
    SAMPLE_PER_BIT = RATE / BIT_PER_SEC;
    
    soundSignal = createSoundSignal(1/BIT_PER_SEC, 880, RATE);

    observable = zeros(1, LENGTH);
    for i = 1:LENGTH
        signalPart = signal((i-1)*SAMPLE_PER_BIT + 1: i*SAMPLE_PER_BIT);
       
        % Two methods to get an observable...
%         observable(i) = mean(signalPart.*signalPart);
        observable(i) = max(xcorr(signalPart, soundSignal));
        
    end
end