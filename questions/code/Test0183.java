public class Test0183 {
    public static void main(String[] args) {
        new Runnable() {
            @Override
            public void run() {
                System.out.println("done");
            }
        }.run();

        new Thread(new Runnable() {
            @Override
            public void run() {
                System.out.println("run2");
            }
        }).start();
    }
}
