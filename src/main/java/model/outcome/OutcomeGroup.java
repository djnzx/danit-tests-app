package model.outcome;

import com.jcabi.jdbc.Outcome;
import model.dto.Group;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OutcomeGroup implements Outcome<Group> {
    @Override
    public Group handle(ResultSet r, Statement stmt) throws SQLException {
        Group ent = new Group();
        if (r.next()) {
            ent.setId(r.getInt("g_id"));
            ent.setName(r.getString("g_name"));
        }
        return ent;
    }
}
