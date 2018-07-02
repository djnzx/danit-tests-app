package core;

import java.util.List;

public interface Statistics {
    int done();
    int left();
    List<Question> doneItems();
    List<Question> leftItems();
}
