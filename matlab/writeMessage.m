function [ascii_message] = writeMessage(message)

MESSAGE_LENGTH = length(message) / 8;
ascii_message = zeros(1,MESSAGE_LENGTH);
for i = 0:MESSAGE_LENGTH-1
    symbol = 0;
    for j = 0:7
        symbol = bitshift(symbol, 1);
        if(message(1+i*8+j) == 1)
            symbol = bitset(symbol, 1);
        end
    end
    ascii_message(i+1) = native2unicode(symbol);
end
            