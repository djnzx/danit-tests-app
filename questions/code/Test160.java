package dan.javatests.code;

public class Test160 {
    public static void main (String [] args) {
        class Horse {
            public String name; // 1
            public Horse(String s) {
                name = s;
            }
        }
        Object obj = new Horse("Zippo"); // 2
        Horse h = (Horse) obj; // 2
        System.out.println(h.name);
    }
}
