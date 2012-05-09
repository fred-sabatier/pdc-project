% This is the receiver main file
% It first records during a given time (or the transmission time)
% Then it finds the starting point of the message and cut it
% to extract the message

% TODO
% Higher level decoding will come on top of it
% Also save the result to a file in ascii

m = frontEnd();

output = convertMessageToAscii(m);
disp('Decoded message: ');
disp(output);

stem(m);