% Implements the front end module.
% i.e. it records the audio signal and transforms it into a 
% binary sequence.

% This can be considered as a black box from outside.

function [encodedMessage] = frontEnd
LENGTH = Constants.FILE_LENGTH; 
RATE = Constants.RATE;
SPS = Constants.SPS;
BPS = Constants.BPS;
NBR_SYMBOLS = Constants.NBR_SYMBOLS;

INIT_DURATION = Constants.INIT_DURATION;
SAFETY_DURATION = Constants.SAFETY_DURATION;

% Recording
recObj = audiorecorder(RATE, 8, 1);
disp('Start recoring')
if(Constants.TWO_COMPUTERS)
    RECORDING_DURATION = INIT_DURATION + LENGTH/BPS + SAFETY_DURATION;
    recordblocking(recObj, RECORDING_DURATION);
else 
    record(recObj) % 
    transmitter; % run transmitter (when using only one computer)
    stop(recObj)
end
disp('End of Recording.');

% Store data in double-precision array.
signal = getaudiodata(recObj);

% Find the starting point
synchroSignal = createSynchroSignal();
synchroPos = findPatternPos(signal, synchroSignal); 

% Extracts the interesting part
thresholdPos = synchroPos + RATE * Constants.SYNCHRO_DURATION;
startingPos = synchroPos + RATE * INIT_DURATION;
endingPos = startingPos + RATE * LENGTH / BPS - 1;
fprintf('Record length: %d, Start: %d, End: %d\n', ...
    length(signal), startingPos, endingPos);

thresholdSignal = signal(thresholdPos : startingPos - 1);
messageSignal = signal(startingPos: endingPos);

% Extract optimal threshold

%threshold = getOptimalTreshold(thresholdSignal);
%fprintf('Optimal threshold: %d \n', threshold);

% Transforms the signal into a real valued sequence
[observable, indice] = extractObservableFromSignal(messageSignal);

for i = 1:length(indice)
    disp(indice(i)-1);
end

% Transforms the latter in a bit sequence
% TODO maybe it should go in the decoder

% Calculate mean energy of synchro signal and define TRESHOLD


subplot(2, 1, 1);
plot(signal);
subplot(2, 1, 2);
stem(observable);


encodedMessage = zeros(1, LENGTH);
for i = 1:LENGTH/4
    l = 4*i-3;
    disp(indice(i)-1);
    switch indice(i)-1
        case 0
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 0;
        case 1
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 0;
        case 2
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 0;
        case 3
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 0;
        case 4
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 0;
        case 5
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 0;
        case 6
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 0;
        case 7
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 0;
        case 8
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 1;
        case 9
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 1;
        case 10
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 1;
        case 11
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 0;
            encodedMessage(l) = 1;
        case 12
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 1;
        case 13
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 0;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 1;
        case 14
            encodedMessage(l+3) = 0;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 1;
        case 15
            encodedMessage(l+3) = 1;
            encodedMessage(l+2) = 1;
            encodedMessage(l+1) = 1;
            encodedMessage(l) = 1;
    end
end
