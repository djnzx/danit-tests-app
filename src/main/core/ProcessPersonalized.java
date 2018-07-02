package core;

import java.util.Iterator;

public class ProcessPersonalized implements Process {

    @Override
    public Statistics statistics() {
        return new StatisticsByStudent();
    }

    @Override
    public void putStep(int question, int answer) {

    }

    @Override
    public Iterator<Question> iterator() {
        return new Iterator<Question>() {
            @Override
            public boolean hasNext() {
                return false;
            }

            @Override
            public Question next() {
                return null;
            }
        };
    }
}
