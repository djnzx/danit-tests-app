package org.danit.model;

import com.jolbox.bonecp.BoneCPDataSource;

import javax.sql.DataSource;

public final class PgDatabase implements Source {
    /**
     * URI
     */
    private final static String DB_URL = "jdbc:postgresql://localhost:5432/danit";
    /**
     * user login
     */
    private final static String USER_NAME = "postgres";
    /**
     * user password
     */
    private final static String USER_PASS = "pg123457";
    /**
     * connection instance
     */
    @SuppressWarnings("PMD.NonStaticInitializer")
    private final DataSource src = new BoneCPDataSource() {{
        setJdbcUrl(PgDatabase.DB_URL);
        setUser(PgDatabase.USER_NAME);
        setPassword(PgDatabase.USER_PASS);
    }};

    @Override
    public DataSource source() {
        return this.src;
    }
}