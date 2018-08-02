import java.io.File;

public class Test062 {
    public static void main(String[]args)throws Exception {
        java.io.PrintWriter out = new java.io.PrintWriter(new File("1.txt"));
        new java.io.OutputStreamWriter(System.out);
        out.println("Hello");
    }
}