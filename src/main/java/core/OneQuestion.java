package core;

import logic.Persistence;
import model.dao.DAOPgAnswer;
import model.dto.Answer;
import model.dto.Question;

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
