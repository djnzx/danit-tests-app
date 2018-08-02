class X implements Runnable {
    public void run() {
        System.out.println("hello");
    }
}
public class Test0016 {
    public static void main(String[] args) {
        X run = new X(); Thread t = new Thread(run); t.start();
    }
}
