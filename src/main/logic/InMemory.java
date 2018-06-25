package logic;

import model.PgDatabase;
import model.dao.DAO;
import model.dao.DAOPgUser;
import model.dto.AbstractEntity;
import model.dto.User;

import java.util.HashMap;
import java.util.function.BiConsumer;
import java.util.function.Supplier;

public class InMemory<T extends AbstractEntity> {
    private final DAO<T> dao;
    private final HashMap<Integer, T> storage = new HashMap<>();

    public InMemory(Supplier<DAO<T>> s) {
        this.dao = s.get();
    }

    public T load(int pk) {
        return storage.put(pk, dao.get(pk));
    }

    public T get(int pk) {
        if (!storage.containsKey(pk)) {
            load(pk);
        }
        return storage.get(pk);
    }

    void forEach(BiConsumer<Integer, T> c) {
        storage.forEach(c);
    }

    @SuppressWarnings("unchecked")
    public <D extends DAO<? extends AbstractEntity>> D dao() {
        return (D)dao;
    }

    public static void main(String[] args) {
        InMemory ue = new InMemory<>(()-> new DAOPgUser(new PgDatabase()));
        User u1 = (User)ue.get(1);
        System.out.println(u1);
        System.out.println(ue.get(2));
        System.out.println(ue.get(3));
        ue.forEach((k, e) -> System.out.println(e));
    }
}
