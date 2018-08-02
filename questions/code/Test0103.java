public class Test0103 {
}

class MyThread2 extends Thread {

    public static void main(String [] args) {
        MyThread2 t = new MyThread2();
        Thread x = new Thread(t);
        x.start(); /* Line 7 */
    }
    public void run() {
        for(int i = 0; i < 3; ++i) {
            System.out.print(i + "..");
        }
    }
}