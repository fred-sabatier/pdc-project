function threshold = getOptimalTreshold(signal, RATE)
    SAMPLE_PER_BIT = 0.5 * RATE;
    
    soundSignal = createSoundSignal(0.5, 440, RATE);

    observable = zeros(1, 4);
    for i = 1:4
        signalPart = signal((i-1)*SAMPLE_PER_BIT + 1: i*SAMPLE_PER_BIT);
       
        % Two methods to get an observable...
        % observable(i) = mean(signalPart.*signalPart);
        observable(i) = max(xcorr(signalPart, soundSignal));
    end
    
    treshold = mean(observable);
end