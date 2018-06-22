package dan.javatests.code;

public class Test044 {
    Test044() {
        System.out.print("Aha");
    }

    class Inner {
        Inner() {
            System.out.print("Uhu");
        }

        public void go() {
            System.out.print("Exe");
        }
    }

    void makeInner() {
        (new Inner() {}).go();
    }

    public static void main (String [] args) {
        Test044 f = new Test044();
        f.makeInner();
    }
}
