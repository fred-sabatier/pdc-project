function [ascii_message] = writeMessage(message)

MESSAGE_LENGTH = length(message) / 8;
int_message = zeros(1,MESSAGE_LENGTH);
for i = 0:MESSAGE_LENGTH-1
    symbol = 0;
    for j = 0:7
        symbol = bitshift(symbol, 1);
        if(message(1+i*8+j) == 1)
            symbol = bitset(symbol, 1);
        end
    end
    int_message(i+1) = char(symbol);
end

ascii_message = char(int_message);
            