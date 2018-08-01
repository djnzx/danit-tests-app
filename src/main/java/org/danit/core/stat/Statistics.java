package org.danit.core.stat;

import org.danit.core.OneQuestion;

import java.util.List;

public interface Statistics {
    int done();
    int left();
    List<OneQuestion> doneItems();
    List<OneQuestion> leftItems();
}
