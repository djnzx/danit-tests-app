public class Test0157 {
}

class Boo {
    Boo(String s) { }
    Boo() { }
}

class Bar extends Boo {
    Bar(String s) {super(s);}
    Bar() { }
    void zoo()
    {
        //Boo f1 = new Boo(24) { };
        //Bar f2 = new Boo(String s) { };
        Boo f3 = new Bar() { };
        //Boo f4 = new Boo.Bar(String s) { };
    }
}
