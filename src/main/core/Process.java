package core;

public interface Process extends Iterable<Question> {
    Statistics statistics();
    void putStep(int question, int answer);
}
