function [pos] = findPatternPos(record, pattern)
assert(length(record) > length(pattern));

% Compute the correlation to  find the position of initial sequence
correlation = xcorr(record, pattern);
% Only take the part where pattern is moving to the right on top 
% of record (cf help xcorr)
correlation = correlation(length(record)+1: length(correlation));

% Find the position where
[maxCorr, pos] = max(correlation);

% Various plot to visualize the data
% subplot(4, 1, 1);
% correlation = correlation / maxCorr;
% plot(correlation);
% 
% subplot(4, 1, 2);
% plot(record);
% 
% subplot(4, 1, 3);
% plot(pattern);
% 
% subplot(4, 1, 4);
% plot(record(pos:length(record))); % Record from sychro