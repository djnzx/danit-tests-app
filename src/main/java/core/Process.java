package core;

import core.stat.Statistics;
import model.dto.Group;
import model.dto.User;

public interface Process {
    Statistics statistics();

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
