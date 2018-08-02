public class Test021 {
    public static int y;

    public static void two(int x) {
        System.out.print("two ");
        y = x;
    }

    public static int one(int z) {
        System.out.print("one ");
        return y = z;
    }

    public static void main(String [] args ) {
        int t = 0;
        assert t > 0 : one(7);
        //assert t > 1 : two(8);
        System.out.println("done ");
    }
}
