package model;

import com.jolbox.bonecp.BoneCPDataSource;

import javax.sql.DataSource;

public final class PgDatabase implements Source {
    private final DataSource src;
    private final static String DB_DRIVER = "org.postgresql.Driver";
    private final static String DB_URL = "jdbc:postgresql://localhost:5432/danit";
    private final static String USER_NAME = "postgres";
    private final static String USER_PASS = "pg123457";

    public PgDatabase() {
        this.src = new BoneCPDataSource() {{
            setDriverClass(PgDatabase.DB_DRIVER);
            setJdbcUrl(PgDatabase.DB_URL);
            setUser(PgDatabase.USER_NAME);
            setPassword(PgDatabase.USER_PASS);
        }};
    }

    @Override
    public DataSource source() {
        return this.src;
    }
}