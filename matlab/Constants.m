classdef Constants
    properties(Constant)
        RATE = 8000;
        NBR_SYMBOLS = 16;
        BPS = 32; % Bits per second
        SPS = 8; % Symbols per second
        FREQUENCY_INTERVAL = 50;
        FREQUENCY_START = 200;
        THRESH_FREQUENCY = 440;
        
        FREQUENCY = (Constants.FREQUENCY_START:Constants.FREQUENCY_INTERVAL:Constants.FREQUENCY_START+(Constants.NBR_SYMBOLS-1)*Constants.FREQUENCY_INTERVAL)
        
        SYNCHRO_DURATION = 2;
        THRESHOLD_DURATION = 8 / Constants.SPS; % DO NOT MODIFY... unless needed ;)
        INIT_DURATION = Constants.SYNCHRO_DURATION + Constants.THRESHOLD_DURATION;
        SAFETY_DURATION = 5; % Records a little longer...
        
        N_CHAR = 100;
        FILE_LENGTH = 8 * Constants.N_CHAR; % File lenght in bits
        
        TWO_COMPUTERS = 0;
    end
end