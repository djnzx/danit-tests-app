public class Test0137 {
    public static void main(String[] args) {
        boolean bool = true;
        if(bool = false) /* Line 2 */{
            System.out.println("a");
        } else if(bool) /* Line 6 */ {
            System.out.println("b");
        } else if(!bool) /* Line 10 */{
            System.out.println("c"); /* Line 12 */
        }
        else {
            System.out.println("d");
        }
    }
}
