public class Test0046 {
    private class Demo { }

    private Demo d;

    void start() {
        d = new Demo();
        this.takeDemo(d); /* Line 7 */
    } /* Line 8 */

    void takeDemo(Demo demo) {
        demo = null;
        demo = new Demo();
    }
}
