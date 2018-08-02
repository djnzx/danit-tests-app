public class Test0153 {
    public static void main(String[] args) {
        int I = 0;
        outer:
        while (true) {
            I++;
            inner:
            for (int j = 0; j < 10; j++) {
                I += j;
                if (j == 3)
                    continue inner;
                break outer;
            }
            continue outer;
        }
        System.out.println(I);
    }
}
