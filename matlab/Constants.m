classdef Constants
    properties(Constant)
        RATE = 22050;
        BPS = 16; % Bits per second
        
        FREQUENCY = 440; % Frequency used to send bits 1
        
        FREQUENCY_0 = 4000;
        FREQUENCY_1 = 5163;
        
        SYNCHRO_DURATION = 2;
        THRESHOLD_DURATION = 8 / Constants.BPS; % DO NOT MODIFY
        INIT_DURATION = Constants.SYNCHRO_DURATION + Constants.THRESHOLD_DURATION;
        SAFETY_DURATION = 5; % Records a little longer...
        
        N_CHAR = 100;
        FILE_LENGTH = 8 * Constants.N_CHAR; % File lenght in bits
        
        TWO_COMPUTERS = 0;
    end
end