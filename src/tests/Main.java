package tests;
import java.io.IOException;

public class Main {

    /**
     * @param args
     */
    public static void main(String[] args) throws IOException {
        System.out.println("Audio test");
        Sound sound = new Sound();
        byte [] b = args[0].getBytes( "8859_1" /* encoding */ );
        
        sound.start();
        
        while(true) {
	        try{
				sound.setFrequency(440);
				Thread.sleep(500);
			} catch (InterruptedException e) {
	            e.printStackTrace();
	        }
        }
       
    }
}
