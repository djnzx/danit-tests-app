public class Test0167 {
    public static void main(String[] args) {
        try {
            assert false : "f";
        } catch (AssertionError e)
        {
            System.out.println("caught");
        }


    }
}
