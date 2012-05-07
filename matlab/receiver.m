% This is the receiver main file
% It first records during a given time (or the transmission time)
% Then it finds the starting point of the message and cut it
% to extract the message

% TODO
% Higher level decoding will come on top of it
% Also save the result to a file in ascii


RATE = 8000;
LENGTH = 13; % Number of bits
BITS_PER_SEC = 10;

% Recording
recObj = audiorecorder(RATE, 8, 1);
disp('Start recoring')

record(recObj) % recordblocking(r, 4);
transmitter
stop(recObj)

disp('End of Recording.');

% Store data in double-precision array.
rec = getaudiodata(recObj);

% Plot the waveform.
plot(rec);

% Find the starting point
synchroSignal = createSynchroSignal(RATE);
synchroPos = findPatternPos(rec, synchroSignal); 

% Extracts the interesting part
startingPos = synchroPos + length(synchroSignal);
endingPos = startingPos + RATE * LENGTH / BITS_PER_SEC;
rec = rec(startingPos: endingPos);

plot(rec);

m = getMessage(rec, RATE, BITS_PER_SEC, LENGTH);

output = writeMessage(m)

stem(m);