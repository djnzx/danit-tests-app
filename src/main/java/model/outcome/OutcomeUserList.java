package model.outcome;

import com.jcabi.jdbc.Outcome;
import model.dto.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OutcomeUserList implements Outcome<List<User>> {
    @Override
    public List<User> handle(final ResultSet r, final Statement stmt) throws SQLException {
        List<User> ent = new ArrayList<>();
        while (r.next()) {
            ent.add(new User(
                    r.getInt("u_id"),
                    r.getString("u_name"),
                    r.getTimestamp("u_regdate"),
                    r.getString("u_login"),
                    r.getString("u_passwd"),
                    r.getInt("u_group")
            ));
        }
        return ent;
    }
}