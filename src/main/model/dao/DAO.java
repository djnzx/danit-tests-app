package model.dao;

import model.dto.AbstractEntity;

public interface DAO<T extends AbstractEntity> {
    default T select(int pk)  {
        return get(pk);
    }
    T get(int pk);
    default T store(T entity)  {
        if (entity.getId()==0) {
            return insert(entity);
        } else {
            return update(entity);
        }
    }
    T insert(T entity);
    T update(T entity);
    default void delete(T entity)  {
        delete(entity.getId());
    }
    void delete(int pk);
}
