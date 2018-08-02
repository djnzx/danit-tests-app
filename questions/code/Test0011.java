public class Test0011 {
    public static void test( boolean a, boolean b) {
        if (a) {
            System.out.println("A");
        } else if (a && b) {
            System.out.println( "A && B");
        } else {
            if (!b) {
                System.out.println( "notB") ;
            }
            else {
                System.out.println( "ELSE" ) ;
            }
        }
    }

    public static void main(String[] args) {
        test(true, true);
        test(true, false);
        test(false, true);
        test(false, false);
    }
}
