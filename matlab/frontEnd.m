% Implements the front end module.
% i.e. it records the audio signal and transforms it into a 
% binary sequence.

% This can be considered as a black box from outside.

function [encodedMessage] = frontEnd

% TODO Modify number of bits accoring to file length and encoding
LENGTH = 24; 

RATE = 8000;
BITS_PER_SEC = 8;


% Recording
recObj = audiorecorder(RATE, 8, 1);
disp('Start recoring')

record(recObj) % recordblocking(r, 4);
transmitter; % run transmitter (when using only one computer)
stop(recObj)

disp('End of Recording.');

% Store data in double-precision array.
rec = getaudiodata(recObj);

% Find the starting point
synchroSignal = createSynchroSignal(RATE);
synchroPos = findPatternPos(rec, synchroSignal); 

% Extracts the interesting part
startingPos = synchroPos + length(synchroSignal);
endingPos = startingPos + RATE * LENGTH / BITS_PER_SEC;
rec = rec(startingPos: endingPos);

% Transforms the signal into a bit sequence
encodedMessage = extractMessageFromSignal(rec, RATE, BITS_PER_SEC, LENGTH);
