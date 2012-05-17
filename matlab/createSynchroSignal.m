function [signal] = createSynchroSignal()
% Play two sounds  nRepet times

% TODO (later) find sequence which is not present in usual
% message (eg use other frequencies)

DURATION = Constants.SYNCHRO_DURATION;
nCroches = 16;
crocheDuration = DURATION/nCroches;
noireDuration = 2 * crocheDuration;

silence = createSoundSignal(crocheDuration, 0);
silenceLong = createSoundSignal(noireDuration, 0);
solLong = createSoundSignal(noireDuration, 396);
do = createSoundSignal(crocheDuration, 528);
mi = createSoundSignal(crocheDuration, 660);
miLong = createSoundSignal(noireDuration, 660);
sol2Long = createSoundSignal(noireDuration, 792);

% signal = [do, silence, mi, silence, do, silence, mi, silence, ...
%     do, silence, mi, silence, do, silence, mi, silence];

% Just for fun
 signal = [mi, mi, silence, mi, silence, do, miLong, ...
     sol2Long, silenceLong, solLong, silenceLong];
