public class Test0070 {
    public static void main(String[] args) {
        String a = "ABCD";
        String b = a.toLowerCase();
        b.replace('a','d');
        b.replace('b','c');
        System.out.println(b);
    }
}
