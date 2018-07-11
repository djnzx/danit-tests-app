package model.dao;

import com.jcabi.jdbc.JdbcSession;
import model.PgDatabase;
import model.Source;
import model.dto.User;
import model.outcome.OutcomeUser;
import model.outcome.OutcomeUserList;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOPgUser implements DAO<User> {
    private final DataSource source;

    public DAOPgUser(Source conn) {
        this(conn.source());
    }

    public DAOPgUser(DataSource src) {
        this.source = src;
    }

    @Override
    public User get(int pk) {
        try {
            return new JdbcSession(source)
                    .sql("SELECT * FROM users WHERE u_id=?")
                    .set(pk)
                    .select(new OutcomeUser());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new User();
    }

    public List<User> getByLogin(String name) {
        return getByLogin(name, false);
    }

    public List<User> getByLogin(String name, boolean strict) {
        try {
            return new JdbcSession(source)
                    .sql("SELECT * FROM users WHERE UPPER(u_login) LIKE UPPER(?)")
                    .set(strict ? name : "%"+name+"%")
                    .select(new OutcomeUserList());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }

    @Override
    public User insert(User e) {
        try {
            return new JdbcSession(source)
                    .sql("INSERT INTO users (u_name, u_login, u_passwd, u_group) VALUES (?, ?, ?, ?)")
                    .set(e.getName())
                    .set(e.getLogin())
                    .set(e.getPasswd())
                    .set(e.getGroupId())
                    .insert(new OutcomeUser());
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return new User();
    }

    @Override
    public User update(User e) {
        try {
            return new JdbcSession(source)
                    .sql("UPDATE users SET u_name=?, u_regdate=?, u_login=?, u_passwd=?, u_group=? WHERE u_id=?")
                    .set(e.getName())
                    .set(e.getDate())
                    .set(e.getLogin())
                    .set(e.getPasswd())
                    .set(e.getGroupId())
                    .set(e.getId())
                    .insert(new OutcomeUser());
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        return new User();
    }

    @Override
    public void delete(int pk) {
        try {
            new JdbcSession(source)
                    .sql("DELETE FROM users WHERE u_id=?")
                    .set(pk)
                    .execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> all() {
        return new ArrayList<>();
    }

    public static void main(String[] args) throws SQLException {
        DAOPgUser dao = new DAOPgUser(new PgDatabase());
        dao.insert(new User("Sergo","serg33").setGroupId(6));
        dao.delete(5);
        dao.delete(6);
    }
}
