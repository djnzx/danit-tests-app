public class Test017 extends Thread {
    public static void main(String [] args) {
        Test017 t = new Test017();
        t.start();
        System.out.print("one. ");
        t.start();
        System.out.print("two. ");
    }

    @Override
    public void run() {
        System.out.print("Thread ");
    }
}