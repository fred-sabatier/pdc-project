package tests;

public class Main {

    /**
     * @param args
     */
    public static void main(String[] args) {
        System.out.println("Audio test");
        Sound sound = new Sound();
        sound.start();
        while (true) {
            try {
                sound.setFrequency(440);
                Thread.sleep(100);
                sound.setFrequency(88000);
                Thread.sleep(100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

}
