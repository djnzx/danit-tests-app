package dan.javatests.code;

public class Test142 {
    public static void main (String [] args) {
        Object o = new Object() /* Line 5 */ {
            public boolean equals(Object obj) {
                return true;
            }
        };      /* Line 11 */
        System.out.println(o.equals("Fred"));
    }
}
