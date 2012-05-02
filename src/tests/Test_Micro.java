package tests;

/**
 * Records a sound into a wave file
 */

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.TargetDataLine;
import javax.swing.JButton;
import javax.swing.JFrame;

import flanagan.complex.Complex;
import math.*;

@SuppressWarnings("serial")
public class Test_Micro extends JFrame {
    // TODO private
    AudioFormat audioFormat;
    TargetDataLine targetDataLine;

    final JButton captureBtn =
        new JButton("Capture");
    final JButton stopBtn = new JButton("Stop");

    public static void main(String args[]) {
        new Test_Micro();
    }

    public Test_Micro() {
        captureBtn.setEnabled(true);
        stopBtn.setEnabled(false);

        //Register anonymous listeners
        captureBtn.addActionListener(
            new ActionListener() {
                public void actionPerformed(
                    ActionEvent e) {
                    captureBtn.setEnabled(false);
                    stopBtn.setEnabled(true);
                    //Capture input data from the
                    // microphone until the Stop button is
                    // clicked.
                    captureAudio();
                }
            }
            );

        stopBtn.addActionListener(
            new ActionListener() {
                public void actionPerformed(
                    ActionEvent e) {
                    captureBtn.setEnabled(true);
                    stopBtn.setEnabled(false);
                    //Terminate the capturing of input data
                    // from the microphone.
                    targetDataLine.stop();
                    targetDataLine.close();
                }
            }
            );

        //Put the buttons in the JFrame
        getContentPane().add(captureBtn);
        getContentPane().add(stopBtn);

        //Finish the GUI and make visible
        getContentPane().setLayout(new FlowLayout());
        setTitle("PDC Project");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        pack();
        setVisible(true);
    }//end constructor

    //This method captures audio input from a
    // microphone and saves it in an audio file.
    private void captureAudio() {
        try {
            //Get things set up for capture
            audioFormat = getAudioFormat();
            DataLine.Info dataLineInfo =
                new DataLine.Info(
                    TargetDataLine.class,
                    audioFormat);
            targetDataLine = (TargetDataLine)
                AudioSystem.getLine(dataLineInfo);

            //Create a thread to capture the microphone
            // data into an audio file and start the
            // thread running.  It will run until the
            // Stop button is clicked.  This method
            // will return after starting the thread.
            CaptureThread ct = new CaptureThread();
            // CaptureThread as Callable and use another thread to
            // calculate the FFT?
           
            ct.start();
        } catch (Exception e) {
            e.printStackTrace();
            System.exit(0);
        }
    }

    //This method creates and returns an
    // AudioFormat object for a given set of format
    // parameters.  If these parameters don't work
    // well for you, try some of the other
    // allowable parameter values, which are shown
    // in comments following the declarations.
    private AudioFormat getAudioFormat() {
        float sampleRate = 8000;
        //8000,11025,16000,22050,44100
        int sampleSizeInBits = 8;

        int channels = 1;

        boolean signed = true;

        boolean bigEndian = false;

        return new AudioFormat(sampleRate,
            sampleSizeInBits,
            channels,
            signed,
            bigEndian);
    }

    //=============================================//

    //Inner class to capture data from microphone
    // and write it to an output audio file.
    class CaptureThread extends Thread {
        private boolean stop = false;

        @Override
        public void run() {
            AudioFileFormat.Type fileType = AudioFileFormat.Type.WAVE;
            File audioFile = new File("junk.wav");
            double sample[] = new double[8000];
            Complex result[] = new Complex[8000];
            FourierTransform fft = new FourierTransform();
            
          
            try {
                targetDataLine.open(audioFormat);
                targetDataLine.start();
                AudioInputStream ais = new AudioInputStream(targetDataLine);

                for(int i = 0; i < 8000; i++) {
                	sample[i] = (double) ais.read() - 127;
                }
                
                // Set Data in the Fourier Class
                fft.setData(sample);
                // Set Sampling Rate
                fft.setDeltaT(8000);
                // Apply FFT
                fft.transform();
                // Get Results from FFT (Complex values)
                result = fft.getTransformedDataAsComplex();
                int pos = 0;
                double max = 0;
                // Only until 4000 because we need only the positive values!
                for(int i = 0; i < 4000; i++) {
                	if (max < result[i].abs()) {
                		// Frequency
                		pos = i;
                		// Amplitude
                		max = result[i].abs(); 		
                	}
                }
                
                System.out.println(pos); // Print frequency with highest amplitude
            	System.out.println(max); // Print value of highest amplitude
                
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }
    
    //=============================================//

    // Inner class to calculate the FFT based on received data
    class FourierThread extends Thread {
        private boolean stop = false;

        @Override
        public void run() {
            AudioFileFormat.Type fileType = AudioFileFormat.Type.WAVE;
            File audioFile = new File("junk.wav");
          
            try {
                targetDataLine.open(audioFormat);
                targetDataLine.start();
                AudioInputStream ais = new AudioInputStream(targetDataLine);

                while (!stop) {
                    int readValue = ais.read();
                    
                    if (readValue != 255) {
                        System.out.println(readValue);
                    }
                
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }

    class CaptureThreadOld extends Thread {
        @Override
        public void run() {
            AudioFileFormat.Type fileType = AudioFileFormat.Type.WAVE;
            File audioFile = new File("junk.wav");

            try {
                targetDataLine.open(audioFormat);
                targetDataLine.start();
                AudioSystem.write(
                    new AudioInputStream(targetDataLine),
                    fileType,
                    audioFile);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }
}
