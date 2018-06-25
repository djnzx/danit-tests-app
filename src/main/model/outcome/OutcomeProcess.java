package model.outcome;

import model.dto.Process;
import com.jcabi.jdbc.Outcome;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OutcomeProcess implements Outcome<Process> {
    @Override
    public Process handle(ResultSet r, Statement statement) throws SQLException {
        Process ent = new Process();
        if (r.next()) {
            ent.setId(r.getInt("p_id"));
            ent.setUser(r.getInt("p_user"));
            ent.setDate(r.getTimestamp("p_date"));
            ent.setQuestion(r.getInt("p_question"));
            ent.setAnswer(r.getInt("p_answer"));
        }
        return ent;
    }
}
