class A {
    final int get(int a, int b) { return 0; }
}
class B extends A {
    //int get(int a, int b) { return 1; }
}
public class Test007 {
    public static void main(String args[])
    {
        B b = new B();
        System.out.println("a=" + b.get(0, 1));
    }
}