package model;

import com.jolbox.bonecp.BoneCPDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PgDatabase implements DbConn {
    private Connection conection;
    private DataSource source;
    private final String DB_DRIVER = "org.postgresql.Driver";
    private final String DB_URL = "jdbc:postgresql://localhost:5432/danit";
    private final String USER_NAME = "postgres";
    private final String USER_PASS = "pg123457";

    public PgDatabase() {
        try {
            this.conection = DriverManager.getConnection(DB_URL, USER_NAME, USER_PASS);

            BoneCPDataSource src = new BoneCPDataSource() {{
                setDriverClass(DB_DRIVER);
                setJdbcUrl(DB_URL);
                setUser(USER_NAME);
                setPassword(USER_PASS);
            }};
            this.source = src;
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Connection connection() {
        return this.conection;
    }

    @Override
    public DataSource source() {
        return this.source;
    }

    public static void main(String[] args) {
        System.out.println(new PgDatabase().connection());
        System.out.println(new PgDatabase().source());
    }
}