public class Test0159 {
    public static void main(String[] args) {
        //Runnable r1 = new Runnable() { };
        //Runnable r2 = new Runnable { public void run() {}};
        //Runnable r3 = new Runnable ( public void run() {});

        System.out.println(
                new Runnable() {
                    public void run() {
                        System.out.println("Hello from thread!");
                    }
                }
                );
    }
}
