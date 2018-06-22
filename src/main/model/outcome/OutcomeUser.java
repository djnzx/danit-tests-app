package model.outcome;

import com.jcabi.jdbc.Outcome;
import model.dto.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OutcomeUser implements Outcome<User> {
    @Override
    public User handle(ResultSet r, Statement stmt) throws SQLException {
        return !r.next() ? new User() : new User(
                r.getInt("u_id"),
                r.getString("u_name"),
                r.getTimestamp("u_regdate"),
                r.getString("u_login"),
                r.getString("u_passwd"),
                r.getInt("u_group")
        );
    }
}
