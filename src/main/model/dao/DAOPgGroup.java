package model.dao;

import com.jcabi.jdbc.JdbcSession;
import com.jcabi.jdbc.Outcome;
import model.DbConn;
import model.dto.Group;
import model.outcome.OutcomeGroup;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOPgGroup implements DAO<Group> {
    private final DataSource source;

    public DAOPgGroup(DbConn conn) {
        this.source = conn.source();
    }

    @Override
    public Group get(int pk) {
        try {
            return new JdbcSession(source)
                    .sql("SELECT * FROM \"group\" WHERE g_id = ?")
                    .set(pk)
                    .select(new OutcomeGroup());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new Group();
    }

    @Override
    public Group insert(Group e) {
        try {
            return new JdbcSession(source)
                    .sql("INSERT INTO \"group\" (g_name) VALUES (?)")
                    .set(e.getName())
                    .insert(new OutcomeGroup());
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return new Group();
    }

    @Override
    public Group update(Group e) {
        try {
            return new JdbcSession(source)
                    .sql("UPDATE \"group\" SET g_name = ? WHERE g_id= ? ")
                    .set(e.getName())
                    .set(e.getId())
                    .set(e.getId())
                    .update(new OutcomeGroup());
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return new Group();
    }

    @Override
    public void delete(int pk) {
        try {
            new JdbcSession(source)
                    .sql("DELETE FROM \"group\" WHERE g_id = ?")
                    .set(pk)
                    .execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Group> all() {
        try {
            return new JdbcSession(source)
                    .sql("SELECT * FROM \"group\" ORDER BY G_ID")
                    .select(new Outcome<List<Group>>() {
                        @Override
                        public List<Group> handle(ResultSet r, Statement stmt) throws SQLException {
                            ArrayList<Group> ent = new ArrayList<>();
                            while (r.next()) {
                                ent.add(new Group(r.getInt("g_id"),r.getString("g_name")));
                            }
                            return ent;
                        }
                    });
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }
}
