package core;

import core.stat.Statistics;
import model.dto.Group;
import model.dto.User;

public interface Process {
    String SKIP = "skip";
    Statistics statistics();

    default void put(String question, String answer) {
        if (answer.equals(SKIP)) {
            skip(question);
        } else {
            store(question, answer);
        }
    }

    default void skip(String s) {
        skip(Integer.parseInt(s));
    }
    void skip(int id);

    default void store(String question, String answer) {
        store(Integer.parseInt(question), Integer.parseInt(answer));
    }
    void store(int question, int answer);

    OneQuestion next();
    boolean hasNext();
    User user();
    Group group();
}
