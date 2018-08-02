public class Test102 extends Thread {
    final StringBuffer sb1 = new StringBuffer();
    final StringBuffer sb2 = new StringBuffer();

    public static void main(String args[]) {
        final Test102 h = new Test102();

        new Thread() {
            public void run() {
                synchronized(this) {
                    h.sb1.append("A");
                    h.sb2.append("B");
                    System.out.print(h.sb1);
                    System.out.print(h.sb2);
                }
            }
        }.start();

        new Thread() {
            public void run() {
                synchronized(this) {
                    h.sb1.append("D");
                    h.sb2.append("C");
                    System.out.print(h.sb2);
                    System.out.print(h.sb1);
                }
            }
        }.start();
    }
}
