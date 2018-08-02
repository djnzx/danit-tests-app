public class Test165 implements Runnable {
    private int x;
    private int y;

    public synchronized void run() {
        for(int i = 0; i < 10; i++) {
            x++; y++;
            System.out.println("x = " + x + ", y = " + y);
        }
    }

    public static void main(String p[]) {
        Test165 that = new Test165();
        (new Thread(that)).start();
        (new Thread(that)).start();
    }
}
