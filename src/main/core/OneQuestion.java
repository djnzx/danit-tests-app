package core;

import logic.Ent;
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
        return (Question) persistence.get(Ent.Question).dao().get(this.id);
    }

    public List<Answer> answers() {
        DAOPgAnswer dao = persistence.get(Ent.Answer).dao();
        return dao.getAllByQuestion(id);
    }

    @Override
    public String toString() {
        return String.format("OneQuestion:[%s] , Answers:[%s]", question(), answers());
    }
}
