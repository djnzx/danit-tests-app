package model.outcome;

import com.jcabi.jdbc.Outcome;
import model.dto.Question;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OutcomeQuestion implements Outcome<Question> {
    @Override
    public Question handle(ResultSet r, Statement stmt) throws SQLException {
        Question q = new Question();
        if (r.next()) {
            q.setId(r.getInt("q_id"));
            q.setText(r.getString("q_number"));
            q.setText(r.getString("q_header"));
            q.setText(r.getString("q_text"));
            q.setDate(r.getTimestamp("q_date_add"));
        }
        return q;
    }
}
