package tests;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.TargetDataLine;

import flanagan.complex.Complex;
import flanagan.math.FourierTransform;

public class SimpleMicro {
    public static final int RATE = 8000; //8000,11025,16000,22050,44100

    public static void main(String[] args) {
        byte[] values = new byte[RATE];

        try {
            //Get things set up for capture
            AudioFormat audioFormat = new AudioFormat(RATE, 8, 1, true, false);

            DataLine.Info dataLineInfo =
                new DataLine.Info(TargetDataLine.class, audioFormat);

            TargetDataLine targetDataLine = (TargetDataLine)
                AudioSystem.getLine(dataLineInfo);

            targetDataLine.open(audioFormat);
            targetDataLine.start();
            AudioInputStream ais = new AudioInputStream(targetDataLine);

            // Interesting things start here
            // Read Values into an array
            ais.read(values); // fills the buffer
            
            //getFourier(values);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static Complex[] getFourier(double[] sample) {
    	
    	FourierTransform fft = new FourierTransform();
    	// Set Data
    	fft.setData(sample);
    	// Set Sampling Rate
    	fft.setDeltaT(RATE);
    	// Apply FFT
        fft.transform();
        // Get Results from FFT (Complex values)
        Complex result[] = fft.getTransformedDataAsComplex();
    	
        return result;
    }
    
    private static boolean determineByte(Complex frequencies[]) {
    	
    	/* Multiple methods possible
    	 * 1. Highest value between 420 - 470Hz (1) or outside (0)
    	 * 2. Define a threshold
    	 */
    	
    	// Read only positive values from the frequency array (until RATE/2)
    	
    	return true;
    }
    
    /*
     * After 8 bits, we need to transform the byte back to
     * an ASCII Symbol and write the symbol out
     * (new Thread?)
     */
    private static void writeSymbol(byte symbol) {
    	
    }
}
