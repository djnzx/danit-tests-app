package core;

import java.util.List;

public class StatisticsByStudent implements Statistics {
    @Override
    public int done() {
        return 0;
    }

    @Override
    public int left() {
        return 0;
    }

    @Override
    public List<Question> doneItems() {
        return null;
    }

    @Override
    public List<Question> leftItems() {
        return null;
    }
}
