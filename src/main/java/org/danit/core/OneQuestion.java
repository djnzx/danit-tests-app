package org.danit.core;

import org.danit.logic.Persistence;
import org.danit.model.dao.DAOPgAnswer;
import org.danit.model.dto.Answer;
import org.danit.model.dto.Question;

import java.util.List;

public class OneQuestion {
    private final Persistence persistence;
    private final int id;

    public OneQuestion(Persistence persistence, int id) {
        this.persistence = persistence;
        this.id = id;
    }

    public Question question() {
        return (Question) persistence.get(Question.class).dao().get(this.id);
    }

    public List<Answer> answers() {
        DAOPgAnswer dao = persistence.get(Answer.class).dao();
        return dao.getAllByQuestion(id);
    }

    @Override
    public String toString() {
        return String.format("OneQuestion:[%s] , Answers:[%s]", question(), answers());
    }
}
