public class Test076 {
    static int s;
    public static void main(String [] args) {
        Test076 p = new Test076();
        p.start();
        System.out.println(s);
    }

    void start() {
        int x = 7;
        twice(x);
        System.out.print(x + " ");
    }

    void twice(int x) {
        x = x*2;
        s = x;
    }
}