% Implements the transmitter

% Length IN RECEIVER must correspond to the size of message in bits
message = readFile('file.txt');

encodedMessage = encodeMessage(message);
 
%  message = [1 0 1 1 1 0 1 0 1 1 1 0 1]; % TODO load from file

waveformGenerator(encodedMessage)