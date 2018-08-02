import java.util.PriorityQueue;
import java.util.Queue;

public class Test0028 {
    public static void main(String[] args) {
        int[] numbers = {1,5,7,2,4};
        Queue myQueue = new PriorityQueue<>();
        int index = 0;
        while(index < numbers.length) {
            myQueue.add(numbers[index]);
            index++;
        }
        System.out.println(myQueue);
    }
}
