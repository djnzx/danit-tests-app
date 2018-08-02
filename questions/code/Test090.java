public class Test090 {
    public static void print() {
        System.out.print("Hello World ");
    }

    public static void main(String[] args) {
        System.out.print("before ");
        Test090 t=null;
        ((Test090)t).print();
        System.out.println("after");
    }
}
