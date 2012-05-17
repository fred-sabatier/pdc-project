function threshold = getOptimalTreshold(signal)
    BPS = Constants.BPS;
    SAMPLE_PER_BIT = 1/BPS * Constants.RATE;
    
    soundSignal = createSoundSignal(1/BPS, 440);

    observable = zeros(1, 8);
    for i = 1:8
        signalPart = signal((i-1)*SAMPLE_PER_BIT + 1: i*SAMPLE_PER_BIT);
       
        observable(i) = max(xcorr(signalPart, soundSignal));
    end
    threshold = mean(observable);
end