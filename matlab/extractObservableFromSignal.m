function [observable, indice] = extractObservableFromSignal(signal)
    LENGTH = Constants.FILE_LENGTH/2;
    RATE = Constants.RATE;
    SPS = Constants.SPS;
    SAMPLE_PER_SYMBOL = RATE / SPS;
    
    soundSignal0 = createSoundSignal(1/SPS, 400);
    soundSignal1 = createSoundSignal(1/SPS, 450);
    soundSignal2 = createSoundSignal(1/SPS, 500);
    soundSignal3 = createSoundSignal(1/SPS, 550);

    observable = zeros(1, LENGTH);
    indice = zeros(1, LENGTH);
    intermediate_obs = zeros(1, 4);
    for i = 1:LENGTH
        signalPart = signal((i-1)*SAMPLE_PER_SYMBOL + 1: i*SAMPLE_PER_SYMBOL);
       
        % Two methods to get an observable...
%         observable(i) = mean(signalPart.*signalPart);
        intermediate_obs(1) =  max(xcorr(signalPart, soundSignal0));
        intermediate_obs(2) =  max(xcorr(signalPart, soundSignal1));
        intermediate_obs(3) =  max(xcorr(signalPart, soundSignal2));
        intermediate_obs(4) =  max(xcorr(signalPart, soundSignal3));
        [observable(i), indice(i)] = max(intermediate_obs);
    end
end