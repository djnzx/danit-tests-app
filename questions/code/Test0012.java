public class Test0012 {
    public static void main(String[] args) {
        Float f = new Float("12");
        switch ((int)(f/1)) {
            case 12: System.out.println("Twelve");
            case 0: System.out.println("Zero");
            default: System.out.println("Default");
        }
    }
}
