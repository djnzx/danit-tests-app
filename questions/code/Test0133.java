public class Test0133 {
}

class Super {
    public Integer getLength() {
        return new Integer(4);
    }
}

class Sub extends Super {
/*
    public Long getLength() {
        return new Long(5);
    }
*/

    public static void main(String[] args) {
        Super sooper = new Super();
        Sub sub = new Sub();
        System.out.println(
                sooper.getLength().toString() + "," + sub.getLength().toString() );
    }
}