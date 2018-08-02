//class MyRunnable extends Runnable{public void run(){}}
class MyRunnable1 implements Runnable{public void run(){}}
//class MyRunnable extends Object{public void run(){}}
//class MyRunnable2 implements Runnable{void run(){}}

public class Test147 {
    public static void main(String[] args) {
        Runnable target = new MyRunnable();
        Thread myThread = new Thread(target);
    }
}
