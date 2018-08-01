package org.danit.model.outcome;

import com.jcabi.jdbc.Outcome;
import org.danit.model.dto.Group;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OutcomeGroupList implements Outcome<List<Group>> {
    @Override
    public List<Group> handle(final ResultSet r, final Statement stmt) throws SQLException {
        ArrayList<Group> ent = new ArrayList<>();
        while (r.next()) {
            ent.add(new Group(r.getInt("g_id"),r.getString("g_name")));
        }
        return ent;
    }
}