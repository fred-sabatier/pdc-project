function encodedMessage = encodeMessage(message)

mLength = length(message);

% Allocate encodedMessage space
encodedMessage = zeros(1, 2*mLength);

for i = 1:mLength
    if(message(i) == 0)
        message(i) = -1;
    end
end

message = [1 1 message];

% calculate encoding

for i = 1:mLength
    encodedMessage(2*i-1) = message(i)* message(i+2);
    encodedMessage(2*i) = message(i) * message(i+1) * message(i+2);
end

% transform back from -1 to 0
for i = 1:length(encodedMessage)
    if(encodedMessage(i) == -1)
        encodedMessage(i) = 0;
    end
end

