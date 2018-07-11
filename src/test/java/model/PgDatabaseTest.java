package model;

import org.junit.Test;

import static org.junit.Assert.*;

public class PgDatabaseTest {
    @Test
    public static void main() {
        System.out.println(new PgDatabase().source());
    }
}