package org.danit.model.dao;

import org.danit.model.PgDatabase;
import org.danit.model.dto.User;
import org.junit.Test;

import java.sql.SQLException;

import static org.junit.Assert.*;

public class DAOPgUserTest {
    @Test
    public  void main() {
        DAOPgUser dao = new DAOPgUser(new PgDatabase());
        dao.insert(new User("Sergo","serg33").setGroupId(6));
        dao.delete(5);
        dao.delete(6);
    }

}