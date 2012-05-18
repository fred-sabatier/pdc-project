classdef Constants
    properties(Constant)
        RATE = 8000;
        BPS = 16; % Bits per second
        
        FREQUENCY = 440; % Frequency used to send bits 1
        FREQUENCY_440 = 440;
        FREQUENCY_500 = 500; % Frequency used to send bits 1
        FREQUENCY_600 = 600; % Frequency used to send bits 1
        FREQUENCY_700 = 700; % Frequency used to send bits 1
        
        SYNCHRO_DURATION = 2;
        THRESHOLD_DURATION = 8 / Constants.BPS; % DO NOT MODIFY
        INIT_DURATION = Constants.SYNCHRO_DURATION + Constants.THRESHOLD_DURATION;
        SAFETY_DURATION = 5; % Records a little longer...
        
        N_CHAR = 16;
        FILE_LENGTH = 8 * Constants.N_CHAR; % File lenght in bits
        
        TWO_COMPUTERS = 0;
    end
end