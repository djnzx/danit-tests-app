package core.stat;

import core.OneQuestion;

import java.util.List;

public interface Statistics {
    int done();
    int left();
    List<OneQuestion> doneItems();
    List<OneQuestion> leftItems();
}
