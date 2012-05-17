% Implements the transmitter

message = readFile('file.txt');

% encodedMessage = encodeMessage(message);

signal = waveformGenerator(message); 

sound(signal, Constants.RATE); % Important to precise the rate, otherwise 8192