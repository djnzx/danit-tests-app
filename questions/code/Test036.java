package dan.javatests.code;

public class Test036 {
    static boolean b1, b2;
    public static void main(String [] args) {
        int x = 0;
        if ( !b1 ) {
            if ( !b2 ) {
                b1 = true;
                x++;
                if ( 5 > 6 ) {
                    x++;
                }
                if ( !b1 )
                    x = x + 10;
                else if ( b2 = true )
                    x = x + 100;
                else if ( b1 | b2 )
                    x = x + 1000;
            }
        }
        System.out.println(x);
    }
}