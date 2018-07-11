package model.dto;

import java.sql.Timestamp;

public class User extends AbstractEntity {
    private String name;
    private Timestamp date;
    private String login;
    private String passwd;
    private int groupId;

    public User() {
    }

    public User(final String nm, final String lg) {
        this.name = nm;
        this.login = lg;
    }

    public User(final String nm, final String lg, final String pwd, final String gid) {
        this(nm, lg, pwd, Integer.parseInt(gid));
    }

    public User(final String nm, final String lg, final String pwd, final int gid) {
        this.name = nm.trim();
        this.login = lg.trim();
        this.passwd = pwd;
        this.groupId = gid;
    }

    public User(final int id, final String nm, final Timestamp dt, final String lgn, final String pwd, final int gId) {
        this.id = id;
        this.name = nm;
        this.date = dt;
        this.login = lgn;
        this.passwd = pwd;
        this.groupId = gId;
    }

    @Override
    public int getId() {
        return id;
    }

    public User setId(final int id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public User setName(final String nm) {
        this.name = nm;
        return this;
    }

    public Timestamp getDate() {
        return date;
    }

    public User setDate(final Timestamp dt) {
        this.date = dt;
        return this;
    }

    public String getLogin() {
        return login;
    }

    public User setLogin(final String lgn) {
        this.login = lgn;
        return this;
    }

    public String getPasswd() {
        return passwd;
    }

    public User setPasswd(final String pwd) {
        this.passwd = pwd;
        return this;
    }

    public int getGroupId() {
        return groupId;
    }

    public User setGroupId(final int gId) {
        this.groupId = gId;
        return this;
    }

    @Override
    public String toString() {
        return String.format("User:[id:%d, Name:%s, Login:%s, Passwd:%s, Group:%s]", id, name, login, passwd, groupId);
    }
}
