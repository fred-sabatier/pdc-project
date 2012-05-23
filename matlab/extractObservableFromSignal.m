function [observable, indice] = extractObservableFromSignal(signal)
    LENGTH = Constants.FILE_LENGTH/4;
    RATE = Constants.RATE;
    SPS = Constants.SPS;
    FREQUENCY = Constants.FREQUENCY;
    NBR_SYMBOLS = Constants.NBR_SYMBOLS;
    SAMPLE_PER_SYMBOL = RATE / SPS;
    
    % define reference signals
    for i = 1:NBR_SYMBOLS
       signal_ref(i,:) = createSoundSignal(1/SPS, FREQUENCY(i));
    end
    
    % allocate
    observable = zeros(1, LENGTH);
    indice = zeros(1, LENGTH);
    intermediate_obs = zeros(1, NBR_SYMBOLS);
    for i = 1:LENGTH
        signalPart = signal((i-1)*SAMPLE_PER_SYMBOL + 1: i*SAMPLE_PER_SYMBOL);
       
        % calculate correlation for each symbol
        for j = 1:16
            intermediate_obs(j) = max(xcorr(signalPart, signal_ref(j,:)));
        end
        [observable(i), indice(i)] = max(intermediate_obs);
    end
end