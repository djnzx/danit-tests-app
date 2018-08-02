public class Test0172 {
}

class Base4 {
    Base4() {
        System.out.print("Base");
    }
}

class Alpha4 extends Base4 {
    public static void main(String[] args) {
        new Alpha4(); /* Line 12 */
        new Base4(); /* Line 13 */
    }
}