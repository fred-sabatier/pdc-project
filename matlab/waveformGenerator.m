function waveformGenerator(message)

% Must correspond to parameters in frontEnd
RATE = 8000;
BITS_PER_SEC = 8;

synchroSignal = createSynchroSignal(RATE);
messageSignal = createMessageSignal(message, RATE, BITS_PER_SEC);
signal = [synchroSignal, messageSignal];

sound(signal, RATE); % Important to precise the rate, otherwise 8192
