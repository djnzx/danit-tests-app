package core;

import logic.Persistence;
import model.dao.DAOPgGroup;
import model.dao.DAOStatistics;
import model.dto.Group;
import model.dto.User;
import java.util.HashMap;
import java.util.List;

public class WholeProcess {
    private final HashMap<Integer, Process> storage = new HashMap<>();
    private final Persistence persistence;
    private final Authenticator authenticator;

    public WholeProcess(Persistence persistence) {
        this.persistence = persistence;
        this.authenticator = new Authenticator(persistence);
    }

    public Process getByStudent(int id) {
        if (!storage.containsKey(id)) {
            storage.put(id, new ProcessPersonalized(persistence, id));
        }
        return storage.get(id);
    }

    public void userLogout(int id) {
        storage.remove(id);
    }

    public User user(int id) {
        return (User) persistence.get(User.class).dao().get(id);
    }

    public Group group(int id) {
        return (Group) persistence.get(Group.class).dao().get(id);
    }

    public List<Group> groups() {
        DAOPgGroup dao = persistence.get(Group.class).dao();
        return dao.all();
    }

    @Override
    public String toString() {
        return String.format("Users in memory:%s", storage.keySet());
    }

    public Authenticator.Result auth(String login, String passwd) {
        return this.authenticator.auth(login, passwd);
    }

    public Authenticator.Result register(String login, String pwd1, String pwd2, String name, String group) {
        return authenticator.register(login, pwd1, pwd2, name, Integer.parseInt(group));
    }

    public DAOStatistics statDAO() {
        return persistence.statDAO();
    }
}
