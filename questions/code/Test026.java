package dan.javatests.code;

public class Test026 {
    public static void main(String [] args) {
        Boolean b1 = new Boolean("false");
        boolean b2;
        b2 = b1.booleanValue();
        if (!b2) {
            b2 = true;
            System.out.print("x ");
        }
        if (b1 & b2) /* Line 13 */ {
            System.out.print("y ");
        }
        System.out.println("z");
    }
}