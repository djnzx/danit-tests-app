package model.dao;

import com.jcabi.jdbc.JdbcSession;
import com.jcabi.jdbc.ListOutcome;
import com.jcabi.jdbc.Utc;
import model.Source;
import model.dto.Question;
import model.outcome.OutcomeQuestion;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOPgQuestion implements DAO<Question> {
    private final DataSource source;

    public DAOPgQuestion(Source conn) {
        this.source = conn.source();
    }

    @Override
    public Question get(int pk) {
        try {
            return new JdbcSession(source)
                    .sql("SELECT * FROM question WHERE q_id = ?")
                    .set(pk)
                    .select(new OutcomeQuestion());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new Question();
    }

    @Override
    public Question insert(Question e) {
        try {
            return new JdbcSession(source)
                    .sql("INSERT into question (q_number, q_header, q_text) VALUES (?, ?, ?)")
                    .set(e.getNumber())
                    .set(e.getHeader())
                    .set(e.getText())
                    .insert(new OutcomeQuestion());
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return new Question();
    }

    @Override
    public Question update(Question e) {
        try {
            return new JdbcSession(source)
                    .sql("UPDATE question SET q_number=?, q_header=?, q_text=?, q_date_add=? WHERE q_id = ?")
                    .set(e.getNumber())
                    .set(e.getHeader())
                    .set(e.getText())
                    .set(new Utc(e.getDate()))
                    .set(e.getId())
                    .update(new OutcomeQuestion());
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return new Question();
    }

    @Override
    public void delete(int pk) {
        try {
            new JdbcSession(source)
                    .sql("DELETE FROM question WHERE q_id = ?")
                    .set(pk)
                    .execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Question> all() {
        return new ArrayList<>();
    }

    public List<Integer> availableByUser(int id) {
        final String sql = "  SELECT q_id FROM question WHERE q_id NOT IN " +
                        "  ( " +
                        "    SELECT p_question " +
                        "    FROM process " +
                        "    WHERE " +
                        "      p_user = ? AND p_answer>0 " +
                        "    GROUP BY p_question " +
                        "  )" +
                        " ORDER BY q_id";
        try {
            return new JdbcSession(source)
                    .sql(sql)
                    .set(id)
                    .select(new ListOutcome<>(r -> r.getInt("q_id")));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }
}