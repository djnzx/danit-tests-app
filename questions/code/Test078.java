public class Test078 {
    public static void main(String[] args) {
        int i = 1, j = 10;
        do {
            if(i > j) {
                break;
            }
            j--;
        } while (++i < 5);
        System.out.println("i = " + i + " and j = " + j);

    }
}
