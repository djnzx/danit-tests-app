package org.danit.logic;

import org.danit.model.PgDatabase;
import org.danit.model.dao.*;
import org.danit.model.dto.*;
import org.danit.model.dto.Process;

import java.util.HashMap;

public class Persistence {
    private final PgDatabase base = new PgDatabase();
    private final HashMap<Class<?>, InMemory<?>> storage = new HashMap<>();
    private final DAOStatistics statistics = new DAOStatistics(base);

    public Persistence() {
        storage.put(User.class, new InMemory<User>(() -> new DAOPgUser(base)));
        storage.put(Group.class, new InMemory<Group>(() -> new DAOPgGroup(base)));
        storage.put(Question.class, new InMemory<Question>(() -> new DAOPgQuestion(base)));
        storage.put(Answer.class, new InMemory<Answer>(() -> new DAOPgAnswer(base)));
        storage.put(Process.class, new InMemory<Process>(() -> new DAOPgProcess(base)));
    }

    @SuppressWarnings("unchecked")
    public <T extends InMemory<? extends AbstractEntity>> T get(final Class clz) {
        return (T) storage.get(clz);
    }

    public DAOStatistics statDAO() {
        return statistics;
    }

    public static void main(final String[] args) {
        Persistence p = new Persistence();
        InMemory<User> inmu = p.get(User.class);
        inmu.get(13);
        inmu.get(14);
        inmu.get(15);
        inmu.forEach((integer, user) -> System.out.println(user));
        p.get(Group.class).get(1);
        p.get(Group.class).get(2);
        p.get(Group.class).get(3);
        p.get(Group.class).forEach((k, e) -> System.out.println(e));

        ((DAOPgProcess)p.get(Process.class).dao())
                .insert(new Process(3,500,-1));

        DAOPgProcess dao = p.get(Process.class).dao();
        dao.insert(new Process(3,500,-1));
    }
}
