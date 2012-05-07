function [bitstream] = readFile(filename)

% open file
fileID = fopen(filename);

% read data into array
data = fscanf(fileID,'%s');

% convert data to bytes
bytes = unicode2native(data);

% transform into 8 bit sequences
bitstr = dec2bin(bytes,8);

% create array out of the 8 bit sequences
bitstream = str2num(reshape(bitstr',[],1))';


