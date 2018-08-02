public class Test0128 {
    public static void main(String[] args) {
        String x = "xyz";
        x.toUpperCase(); /* Line 2 */
        String y = x.replace('Y', 'y');
        y = y + "abc";
        System.out.println(y);
    }
}
