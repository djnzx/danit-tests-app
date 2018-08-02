class Bar9 { }

public class Test0045 {

    Bar9 doBar() {
        Bar9 b = new Bar9(); // 6
        return b; // 7
    }

    public static void main (String args[]) {
        Test0045 t = new Test0045();  // 11
        Bar9 newBar = t.doBar();  // 12
        System.out.println("newBar");
        newBar = new Bar9(); // 14
        System.out.println("finishing"); // 15
    }

}
