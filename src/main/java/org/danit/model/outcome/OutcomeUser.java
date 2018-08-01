package org.danit.model.outcome;

import com.jcabi.jdbc.Outcome;
import org.danit.model.dto.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public final class OutcomeUser implements Outcome<User> {
    @Override
    public User handle(final ResultSet r, final Statement stmt) throws SQLException {
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
