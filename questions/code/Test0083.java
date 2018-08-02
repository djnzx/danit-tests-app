import java.util.Enumeration;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Vector;

public class Test0083 {
    public static void main (String[] args) {
        Object x = new Vector().elements();
        System.out.print((x instanceof Enumeration)+",");
        System.out.print((x instanceof Iterator)+",");
        System.out.print(x instanceof ListIterator);
    }
}
