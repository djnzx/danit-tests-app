package logic;

import model.PgDatabase;
import model.dao.*;
import model.dto.*;
import model.dto.Process;

import java.util.HashMap;

public class Persistence {
    private final PgDatabase base = new PgDatabase();
    private final HashMap<Ent, InMemory<?>> storage = new HashMap<>();

    public Persistence() {
        storage.put(Ent.User, new InMemory<User>(()->new DAOPgUser(base)));
        storage.put(Ent.Group, new InMemory<Group>(()->new DAOPgGroup(base)));
        storage.put(Ent.Question, new InMemory<Question>(()->new DAOPgQuestion(base)));
        storage.put(Ent.Answer, new InMemory<Answer>(()->new DAOPgAnswer(base)));
        storage.put(Ent.Process, new InMemory<Process>(()->new DAOPgProcess(base)));
    }

    @SuppressWarnings("unchecked")
    public <T extends InMemory<? extends AbstractEntity>> T get(Ent ent) {
        return (T)storage.get(ent);
    }

    public static void main(String[] args) {
        Persistence p = new Persistence();
        InMemory<User> inmu = p.get(Ent.User);
        inmu.get(1);
        inmu.get(2);
        inmu.get(3);
        inmu.forEach((integer, user) -> System.out.println(user));
        p.get(Ent.Group).get(1);
        p.get(Ent.Group).get(2);
        p.get(Ent.Group).get(3);
        p.get(Ent.Group).forEach((k, e) -> System.out.println(e));

        ((DAOPgProcess)p.get(Ent.Process).dao())
                .insert(new Process(3,500,-1));

        DAOPgProcess dao = p.get(Ent.Process).dao();
        dao.insert(new Process(3,500,-1));
    }
}
