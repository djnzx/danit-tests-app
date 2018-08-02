interface Base {
    boolean m1 ();
    byte m2(short s);
}
/*
interface Base2 implements Base {}
abstract class Class21 extends Base { public boolean m1(){ return true; }}
*/
abstract class Class22 implements Base {}
abstract class Class23 implements Base { public boolean m1(){ return (7 > 4); }}
/*
abstract class Class24 implements Base { protected boolean m1(){ return (5 > 7) }}
*/
public class Test0072 {
}
