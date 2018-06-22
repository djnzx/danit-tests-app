package model.outcome;

import com.jcabi.jdbc.Outcome;
import model.dto.Answer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OutcomeAnswer implements Outcome<Answer> {
    @Override
    public Answer handle(ResultSet r, Statement stmt) throws SQLException {
        Answer ent = new Answer();
        if (r.next()) {
            ent.setId(r.getInt("a_id"));
            ent.setQuestionId(r.getInt("a_question_id"));
            ent.setText(r.getString("a_text"));
            ent.setType(r.getInt("a_type"));
        }
        return ent;
    }
}
