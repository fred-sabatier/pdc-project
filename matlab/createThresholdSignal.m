function thresholdSignal = createThresholdSignal()
    % Generate bit signal of same duration and frequency
    % in order to set the threshold value
    SPS = Constants.SPS;
    s1 = createSoundSignal(1/SPS, Constants.FREQUENCY);
    s2 = createSoundSignal(1/SPS, 0);
    thresholdSignal = [s1 s2 s1 s2 s1 s2 s1 s2];
    