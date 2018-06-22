package dan.javatests.code;

public class Test037 {
    static boolean b;
    public static void main(String [] args) {
        short hand = 42;
        if ( hand < 50 && !b )
            hand++;
        if ( hand > 50 );
        else if ( hand > 40 ) {
            hand += 7;
            hand++;
        }
        else
            --hand;
        System.out.println(hand);
    }
}