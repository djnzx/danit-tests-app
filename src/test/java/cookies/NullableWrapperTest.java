package cookies;

import org.junit.Test;

import java.util.*;

public class NullableWrapperTest {

    @Test
    public void design() {
        Integer[] i1 = new Integer[]{1, 2, 3};
        // Integer[] i000 = Arrays.stream({1,2,3,4}).boxed().toArray(Integer[]::new);
        Collection<Integer> integers10 = new NullableWrapper<>(i1).get();
        List<Integer> integers11 = new NullableWrapper<>(i1).get();
        ArrayList<Integer> integers12 = new NullableWrapper<>(i1).get();
        List<Integer>          integers14 = new NullableWrapper<>(i1).get(ArrayList::new);
        Collection<Integer>    integers15 = new NullableWrapper<>(i1).get(LinkedList::new);
        LinkedList<Integer>    integers16 = new NullableWrapper<>(i1).get(LinkedList::new);
        PriorityQueue<Integer> integers17 = new NullableWrapper<>(i1).get(PriorityQueue::new);
        System.out.println(integers10);
        System.out.println(integers11);
        System.out.println(integers12);
        System.out.println(integers14);
        System.out.println(integers15);
        System.out.println(integers16);
        System.out.println(integers17);

        Integer[] i2 = null;
        Collection<Integer> integers20 = new NullableWrapper<>(i2).get();
        List<Integer>       integers21 = new NullableWrapper<>(i2).get();

        System.out.println(integers20);
        System.out.println(integers21);
    }
}