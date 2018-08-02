class Super7 {
    public int i = 0;

    public Super7 (String text) /* Line 4 */{
        i = 1;
    }
}

class Sub8 extends Super7 {

    public Sub8 (String text) {
        super("x");
        i = 2;
    }

    public static void main(String args[]) {
        Sub8 sub = new Sub8("Hello");
        System.out.println(sub.i);
    }
}

public class Test0171 {
}
