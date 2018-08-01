package org.danit.model.dto;

public abstract class AbstractEntity implements Identifiable {
    protected int id;

    @Override
    public int getId() {
        return this.id;
    }

    public AbstractEntity setId(int id) {
        this.id = id;
        return this;
    }

    public boolean isEmpty() {
        return this.id == 0;
    }
}
