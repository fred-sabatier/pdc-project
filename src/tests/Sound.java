package tests;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.SourceDataLine;

public class Sound extends Thread {
    public static final int RATE = 44100;
    private SourceDataLine line;
    private byte[] soundWave; // This contains a sampling of one sound wave

    public Sound() {
        AudioFormat format = new AudioFormat(RATE, 8, 1, true, false);
        DataLine.Info info = new DataLine.Info(SourceDataLine.class, format);
        if (line == null) {
            try {
                line = (SourceDataLine) AudioSystem.getLine(info);
                line.open(format);
            } catch (Exception e) {
                e.printStackTrace();
            }
            line.start();
        }
    }

    public void setFrequency(int frequency) {
        int nSamplePerPeriod = RATE / frequency;

        soundWave = new byte[nSamplePerPeriod];
        for (int i = 0; i < nSamplePerPeriod; i++) {
            soundWave[i] =
                (byte) (127 * Math.sin(i * 2 * Math.PI / nSamplePerPeriod));
        }

        line.flush(); // Remove all previous data on the line
    }

    @Override
    public void run() {
        while (true) {
            // System.out.println(line.available());
            line.write(soundWave, 0, soundWave.length);
        }
    }
}
