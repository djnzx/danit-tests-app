package model.dao;

import com.jcabi.jdbc.JdbcSession;
import com.jcabi.jdbc.Utc;
import model.DbConn;
import model.dto.Process;
import model.outcome.OutcomeProcess;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOPgProcess implements DAO<Process> {
    private final DataSource source;

    public DAOPgProcess(DbConn conn) {
        this(conn.source());
    }

    public DAOPgProcess(DataSource src) {
        this.source = src;
    }

    @Override
    public Process get(int pk) {
        try {
            return new JdbcSession(source)
                    .sql("SELECT * FROM process WHERE p_id = ?")
                    .set(pk)
                    .select(new OutcomeProcess());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new Process();
    }

    @Override
    public Process insert(Process e) {
        try {
            return new JdbcSession(source)
                    .sql("INSERT INTO process (p_user, p_question, p_answer) VALUES (?, ?, ?)")
                    .set(e.getUser())
                    .set(e.getQuestion())
                    .set(e.getAnswer())
                    .insert(new OutcomeProcess());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return new Process();
    }

    @Override
    public Process update(Process e) {
        try {
            return new JdbcSession(source)
                    .sql("UPDATE process SET p_user = ?, p_date = ?, p_question = ?, p_answer = ? WHERE p_id = ?")
                    .set(e.getUser())
                    .set(e.getDate())
                    .set(e.getQuestion())
                    .set(e.getAnswer())
                    .set(e.getId())
                    .update(new OutcomeProcess());
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return new Process();
    }

    @Override
    public void delete(int pk) {
        try {
            new JdbcSession(source)
                    .sql("DELETE FROM process WHERE p_id = ?")
                    .set(pk)
                    .execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Process> all() {
        return new ArrayList<>();
    }
}
