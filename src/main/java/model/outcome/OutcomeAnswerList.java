package model.outcome;

import com.jcabi.jdbc.Outcome;
import model.dto.Answer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OutcomeAnswerList implements Outcome<List<Answer>> {
    @Override
    public List<Answer> handle(final ResultSet r, final Statement stmt) throws SQLException {
        ArrayList<Answer> ents = new ArrayList<>();
        while (r.next()) {
            ents.add(new Answer(
                    r.getInt("a_id"),
                    r.getInt("a_question_id"),
                    r.getString("a_text"),
                    r.getInt("a_type")
            ));
        }
        return ents;
    }
}
