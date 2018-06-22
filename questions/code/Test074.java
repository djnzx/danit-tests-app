package dan.javatests.code;

public class Test074 {
    public static void main(String [] args) {
        Test074 p = new Test074();
        p.start();
    }

    void start() {
        boolean b1 = false;
        boolean b2 = fix(b1);
        System.out.println(b1 + " " + b2);
    }

    boolean fix(boolean b1) {
        b1 = true;
        return b1;
    }
}