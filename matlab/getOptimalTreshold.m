function threshold = getOptimalTreshold(signal)
    SPS = Constants.SPS;
    SAMPLE_PER_SYMBOL = 1/SPS * Constants.RATE;
    
    soundSignal = createSoundSignal(1/SPS, Constants.FREQUENCY);

    observable = zeros(1, 8);
    for i = 1:8
        signalPart = signal((i-1)*SAMPLE_PER_SYMBOL + 1: i*SAMPLE_PER_SYMBOL);
       
        observable(i) = max(xcorr(signalPart, soundSignal));
    end
    threshold = mean(observable);
end