package extra;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.StreamSupport;

public class Coverage {
    static int total=0;
    static final String TOPIC_DELIMITER="###";
    static final String PATH="./questions";
    static final String PATTERN="*.txt";

    public static String fileToTopic(Path p) {
        String fname=p.getFileName().toString();
        return fname.substring(1,fname.length()-4);
    }

    public static void process(Path path) {
        try {
            long amount = Files.readAllLines(path, StandardCharsets.UTF_8)
                    .stream().filter(s1 -> s1.startsWith(TOPIC_DELIMITER)).count();
            System.out.printf("%-12s:%d\n", fileToTopic(path), increment(amount));
        } catch (IOException e) {}
    }

    private static long increment(long amount) {
        total+=amount;
        return amount;
    }

    public static void main(String[] args) throws IOException {
        StreamSupport.stream(
                Files.newDirectoryStream(
                        Paths.get(PATH), PATTERN).spliterator(),
                false)
                .sorted()
                .forEach(Coverage::process);
        System.out.printf("%-12s:%d\n", "total", total);
    }
}
