function [observable] = extractObservableFromSignal(signal)
    LENGTH = Constants.FILE_LENGTH;
    RATE = Constants.RATE;
    BPS = Constants.BPS;
    SAMPLE_PER_BIT = RATE / BPS;
    
    soundSignal_440 = createSoundSignal(1/BPS, Constants.FREQUENCY_440);
    soundSignal_500 = createSoundSignal(1/BPS, Constants.FREQUENCY_500);
    soundSignal_600 = createSoundSignal(1/BPS, Constants.FREQUENCY_600);
    soundSignal_700 = createSoundSignal(1/BPS, Constants.FREQUENCY_700);

    observable = zeros(1, LENGTH);
    intermediate_obs = zeros(1, 4);
    for i = 1:LENGTH
        signalPart = signal((i-1)*SAMPLE_PER_BIT + 1: i*SAMPLE_PER_BIT);
       
        % Two methods to get an observable...
%         observable(i) = mean(signalPart.*signalPart);
        intermediate_obs(1) =  max(xcorr(signalPart, soundSignal_440));
        intermediate_obs(2) =  max(xcorr(signalPart, soundSignal_500));
        intermediate_obs(3) =  max(xcorr(signalPart, soundSignal_600));
        intermediate_obs(4) =  max(xcorr(signalPart, soundSignal_700));
        observable(i) = max(intermediate_obs);
    end
end