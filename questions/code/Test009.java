public class Test009 {
    boolean [] b = new boolean[3];
    int c = 0;

    public static void main(String [] args) {
        Test009 ba = new Test009();
        ba.set(ba.b, 0);
        ba.set(ba.b, 2);
        ba.test();
    }

    void set(boolean []x, int i) {
        x[i] = true;
        ++c;
    }

    void test() {
        if ( b[0] && b[1] | b[2] )  c++;
        if ( b[1] && b[(++c - 2)] ) c+=7;
        System.out.println("c=" + c);
    }
}
