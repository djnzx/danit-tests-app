package org.danit.logic;

import org.danit.model.dao.DAO;
import org.danit.model.dto.AbstractEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.function.BiConsumer;
import java.util.function.Supplier;

public class InMemory<T extends AbstractEntity> {
    private final DAO<T> dao;
    private final HashMap<Integer, T> storage = new HashMap<>();
    static Logger log = LoggerFactory.getLogger(InMemory.class);

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
}
