package tests;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;

public class SimpleSound {
    public static final int RATE = 8000; //8000,11025,16000,22050,44100

    public static void main(String[] args) {
        try {
            AudioFormat format = new AudioFormat(RATE, 8, 1, true, false);
            DataLine.Info info = new DataLine.Info(SourceDataLine.class, format);
            SourceDataLine line = (SourceDataLine) AudioSystem.getLine(info);
            line.open(format);
            line.start();

            byte[] soundWave = createSound(440, 500);
            byte[] noSound = createSound(1, 500);

            // sounds occupied ;)
            while (true) {
                line.write(soundWave, 0, soundWave.length);
                line.write(noSound, 0, noSound.length);
            }

        } catch (LineUnavailableException e) {
            e.printStackTrace();
        }
    }

    private static byte[] createSound(int frequency, int durationMillis) {
        double nSamplesPerPeriod = ((double) RATE) / frequency;
        int nSamples = RATE * durationMillis / 1000;

        byte[] soundWave = new byte[nSamples];
        for (int i = 0; i < nSamples; i++) {
            soundWave[i] =
                (byte) (127 * Math.sin(i * 2 * Math.PI / nSamplesPerPeriod));
        }

        return soundWave;
    }

}
