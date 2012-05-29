% Implements the front end module.
% i.e. it records the audio signal and transforms it into a 
% binary sequence.

% This can be considered as a black box from outside.

function [encodedMessage] = frontEnd
LENGTH = Constants.FILE_LENGTH; 
RATE = Constants.RATE;
BPS = Constants.BPS;

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

messageSignal = signal(startingPos: endingPos);


% Transforms the signal into a real valued sequence
encodedMessage = extractObservableFromSignal(messageSignal);
