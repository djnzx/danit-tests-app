public class Test008 {
    public static void main(String [] args) {
        Test008 s = new Test008();
        s.start();
    }

    void start() {
        int a = 3;
        int b = 4;
        System.out.print(" " + 7 + 2 + " ");
        System.out.print(a + b);
        System.out.print(" " + a + b + " ");
        System.out.print(hello() + a + b + " ");
        System.out.println(a + b + hello());
    }

    String hello() {
        return "hello";
    }
}