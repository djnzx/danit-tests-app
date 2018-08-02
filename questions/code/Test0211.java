public class Test0211 {
    static int x;

    static boolean catch1() {
        x++;
        return true;
    }

    public static void main(String[] args) {
        x=0;
        if ((catch1() | catch1()) || catch1())
            x++;
        System.out.println(x);
    }
}
