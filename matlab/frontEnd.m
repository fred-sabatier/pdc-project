% Implements the front end module.
% i.e. it records the audio signal and transforms it into a 
% binary sequence.

% This can be considered as a black box from outside.

function [encodedMessage] = frontEnd

% TODO Modify number of bits accoring to file length and encoding
TWO_COMPUTERS = 0;

N_CHAR = 15;
LENGTH = 8 * N_CHAR; 

RATE = 8000;
BITS_PER_SEC = 8;


% Recording
recObj = audiorecorder(RATE, 8, 1);
disp('Start recoring')
if(TWO_COMPUTERS)
    recordblocking(recObj, LENGTH / BITS_PER_SEC + 2 + 2);
else 
    record(recObj) % 
    transmitter; % run transmitter (when using only one computer)
    stop(recObj)
end

disp('End of Recording.');

% Store data in double-precision array.
rec = getaudiodata(recObj);

% Find the starting point
synchroSignal = createSynchroSignal(RATE);
synchroPos = findPatternPos(rec, synchroSignal); 

% Extracts the interesting part
startingPos = synchroPos + length(synchroSignal);
endingPos = startingPos + RATE * LENGTH / BITS_PER_SEC;
disp(startingPos)
disp(endingPos)
disp(length(rec))
syncSig = rec(synchroPos : startingPos);
rec = rec(startingPos: endingPos);

% Transforms the signal into a real valued sequence
observable = extractObservableFromSignal(rec, RATE, BITS_PER_SEC, LENGTH);

% Transforms the latter in a bit sequence
% TODO maybe it should go in the decoder

% Calculate mean energy of synchro signal and define TRESHOLD

THRESHOLD = getOptimalTreshold(syncSig, RATE);
disp('Threshold is set at 3... ajust your sound or the threshold');

subplot(2, 1, 1);
plot(rec);
subplot(2, 1, 2);
stem(observable);


encodedMessage = zeros(1, LENGTH);
for i = 1:LENGTH
    if(observable(i) > THRESHOLD)
        encodedMessage(i) = 1;
    else
        encodedMessage(i) = 0;
    end
end
