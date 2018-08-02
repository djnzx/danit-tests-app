public class Test0162 implements Runnable {
    private int x;
    private int y;

    public static void main(String [] args) {
        Test0162 that = new Test0162();
        (new Thread(that)).start( ); /* Line 8 */
        (new Thread(that)).start( ); /* Line 9 */
    }
    public synchronized void run( ) /* Line 11 */{
        for (;;) /* Line 13 */{
            x++;
            y++;
            System.out.println("x = " + x + "y = " + y);
        }
    }
}