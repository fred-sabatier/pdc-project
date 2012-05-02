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
        
        for(int i = 0; i < 3; i++) {
        	for ( int mask = 0x01; mask != 0x100; mask <<= 1 ) {
        		boolean value = ( b[i] & mask ) != 0;
        		if(value) {
        			try{
        				sound.setFrequency(10);
        				Thread.sleep(500);
        			} catch (InterruptedException e) {
                        e.printStackTrace();
                    }
        		} else {
        			try{
        				sound.setFrequency(440);
        				Thread.sleep(500);
        			} catch (InterruptedException e) {
                        e.printStackTrace();
                    }
        		}
        	}
        }
        System.exit(0);
    }
}
