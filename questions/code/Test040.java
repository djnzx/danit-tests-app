package dan.javatests.code;

public class Test040 {
    public static void main(String[] args) {
        int i = 0;
        label:
        if (i < 2) {
            System.out.print("I is " + i);
            i++;
            //continue label;
        }
    }
}
