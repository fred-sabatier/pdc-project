package tests;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.TargetDataLine;

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

            ais.read(values); // fills the buffer
            doSomething(values);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void doSomething(byte[] values) {
        // print the recorded values
        for (int i = 0; i < RATE; i++) {
            System.out.println(values[i]);
        }
    }
}
