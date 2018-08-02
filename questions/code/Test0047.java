public class Test0047 {

    static X m1(X mx) {
        mx = new X();
        return mx;
    }

    public static void main(String [] args) {
        X x = new X();
        X x2 = m1(x); /* Line 6 */
        X x4 = new X();
        x2 = x4; /* Line 8 */
        //doComplexStuff();
    }
}
