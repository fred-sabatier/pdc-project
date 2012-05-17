function thresholdSignal = createThresholdSignal()
    % Generate bit signal of same duration and frequency
    % in order to set the threshold value
    BPS = Constants.BPS;
    s1 = createSoundSignal(1/BPS, Constants.FREQUENCY);
    s2 = createSoundSignal(1/BPS, 0);
    thresholdSignal = [s1 s2 s1 s2 s1 s2 s1 s2];
    