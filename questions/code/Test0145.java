public class Test0145 {
}

class ThreadDemo {
    private int count = 1;
    public synchronized void doSomething() {
        for (int i = 0; i < 10; i++)
            System.out.println(count++);
    }
    public static void main(String[] args) {
        ThreadDemo demo = new ThreadDemo();
        Thread a1 = new A6(demo);
        Thread a2 = new A6(demo);
        a1.start();
        a2.start();
    }
}

class A6 extends Thread {
    ThreadDemo demo;
    public A6(ThreadDemo td) {
        demo = td;
    }
    public void run() {
        demo.doSomething();
    }
}
