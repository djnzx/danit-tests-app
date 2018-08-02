public abstract class Test0161 {

    public int getNum() {
        return 45;
    }

    public abstract class Bar {
        public int getNum() {
            return 38;
        }
    }

    public static void main (String [] args) {
        Test0161 t = new Test0161() {
            public int getNum() {
                return 22;
            }
        };

        Test0161.Bar f = t.new Bar() {
            public int getNum() {
                return 57;
            }
        };

        System.out.println(f.getNum() + " " + t.getNum());
    }
}
