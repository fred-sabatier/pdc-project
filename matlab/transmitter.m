%implements the receiver

RATE = 8000;
LENGTH = 2;
BITS_PER_SEC = 1;

% Length must correspond to LENGTH  IN RECEIVER
message = readFile('file.txt');
% message = [1 1 1 1 1 0 1 0 1 1 1 0 1]; % TODO load from file

messageSignal = createMessageSignal(message, RATE, BITS_PER_SEC);

synchroSignal = createSynchroSignal(RATE);
signal = [synchroSignal, messageSignal];

sound(signal, RATE); % Important to precise the rate, otherwise 8192
