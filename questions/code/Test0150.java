class A7 {
    //public A(int x){}
}

class B7 extends A7 { }

public class Test0150 {
    public static void main (String args []) {
        A7 a = new B7();
        System.out.println("complete");
    }
}
