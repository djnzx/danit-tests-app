public class Test0098 {
    public static void throwit () {
        System.out.print("throwit ");
        throw new RuntimeException();
    }
    public static void main(String [] args) {
        try {
            System.out.print("hello ");
            throwit();
        } catch (Exception re ) {
            System.out.print("caught ");
        } finally {
            System.out.print("finally ");
        }
        System.out.println("after ");
    }
}
