function signal = waveformGenerator(message)
    synchroSignal = createSynchroSignal();
    thresholdSignal = createThresholdSignal();
    messageSignal = createMessageSignal(message);
    signal = [synchroSignal, thresholdSignal, messageSignal];
