public class Test039 {
    public static void main(String[] args) {
        int i = 0, j = 5;
        tp:
        for (; ; ) {
            i++;
            for (; ; ) {
                if (i > --j) {
                    break tp;
                }
            }
            //System.out.println("i =" + i + ", j = " + j);
        }
    }
}
