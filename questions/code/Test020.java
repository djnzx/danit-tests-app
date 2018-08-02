public class Test020 {
    public void one() {
        assert false; // 1
        assert false; // 2
    }

    public void two() {
        while(true) {
            assert false; // 3
        }
        //assert false; // 4
    }
}

