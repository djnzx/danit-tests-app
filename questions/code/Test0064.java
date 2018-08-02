class MyOuter {
    public static class MyInner {
        public static void foo() { }
    }
}

public class Test0064 {
    public static void main(String[] args) {
        MyOuter.MyInner m = new MyOuter.MyInner();
    }
}
