package model.dao;

import com.jcabi.jdbc.JdbcSession;
import com.jcabi.jdbc.Outcome;
import model.DbConn;
import model.dto.AbstractEntity;
import model.dto.Stat001;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DAOStatistics extends AbstractEntity {
    private final DataSource source;

    public DAOStatistics(DbConn conn) {
        this.source = conn.source();
    }

    public List<Stat001> stat001() {
        final String SQL="with q as (select p_user, count(p_question) cnt from process\n" +
                "where p_answer>0\n" +
                "group by p_user)\n" +
                "SELECT u_id, u_name, g_name, q.cnt from users\n" +
                "join q on p_user=users.u_id\n" +
                "join \"group\" on \"group\".g_id=u_group\n" +
                "where u_role=1 order by g_name, u_name";
        try {
            return new JdbcSession(source)
                    .sql(SQL)
                    .select(new Outcome<List<Stat001>>() {
                        @Override
                        public List<Stat001> handle(ResultSet r, Statement stmt) throws SQLException {
                            ArrayList<Stat001> a = new ArrayList<>();
                            while (r.next()) {
                                a.add( new Stat001(
                                        r.getInt(1),
                                        r.getString(2),
                                        r.getString(3),
                                        r.getInt(4)));
                            }
                            return a;
                        }
                    });
        } catch (SQLException e) { }
        return new ArrayList<>();
    }
}
