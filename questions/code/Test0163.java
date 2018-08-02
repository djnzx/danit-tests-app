public class Test0163 {
}

class MyThread77 extends Thread {
    public static void main(String [] args) {
        MyThread77 t = new MyThread77(); /* Line 5 */
        t.run();  /* Line 6 */
    }

    public void run() {
        for(int i=1; i < 3; ++i)
        {
            System.out.print(i + "..");
        }
    }
}