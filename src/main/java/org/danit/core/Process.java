package org.danit.core;

import org.danit.core.stat.Statistics;
import org.danit.model.dto.Group;
import org.danit.model.dto.User;

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
