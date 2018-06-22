package cookies;

import java.util.*;
import java.util.function.Supplier;

public class NullableArrayWrapper<T> {
    private final T[] raw;

    public NullableArrayWrapper(T[] raw) {
        this.raw=raw;
    }

    public <L extends Collection<T>> L get() {
        return get(ArrayList::new);
    }

    @SuppressWarnings("unchecked")
    public <L extends Collection<T>> L get(Supplier<? extends Collection<T>> supp) {
        Collection<T> c = supp.get();
        if (raw != null) {
            c.addAll(Arrays.asList(raw));
        }
        return (L) c;
    }

    public <X extends Object> X utimate(Supplier<X> supp) {
        return supp.get();
    }

    public static void main(String[] args) {
        Integer[] i1 = new Integer[]{1, 2, 3};
        // Integer[] i000 = Arrays.stream({1,2,3,4}).boxed().toArray(Integer[]::new);
        Collection<Integer>    integers10 = new NullableArrayWrapper<>(i1).get();
        List<Integer>          integers11 = new NullableArrayWrapper<>(i1).get();
        ArrayList<Integer>     integers12 = new NullableArrayWrapper<>(i1).get();
        List<Integer>          integers14 = new NullableArrayWrapper<>(i1).get(ArrayList::new);
        Collection<Integer>    integers15 = new NullableArrayWrapper<>(i1).get(LinkedList::new);
        LinkedList<Integer>    integers16 = new NullableArrayWrapper<>(i1).get(LinkedList::new);
        PriorityQueue<Integer> integers17 = new NullableArrayWrapper<>(i1).get(PriorityQueue::new);
        System.out.println(integers10);
        System.out.println(integers11);
        System.out.println(integers12);
        System.out.println(integers14);
        System.out.println(integers15);
        System.out.println(integers16);
        System.out.println(integers17);

        Integer[] i2 = null;
        Collection<Integer> integers20 = new NullableArrayWrapper<>(i2).get();
        List<Integer>       integers21 = new NullableArrayWrapper<>(i2).get();

        System.out.println(integers20);
        System.out.println(integers21);
        String utimate = new NullableArrayWrapper<>(i1).utimate(String::new);
    }
}

