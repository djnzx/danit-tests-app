package model.dto;

public class Group extends AbstractEntity {
    private String name;

    public Group() {
    }

    public Group(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public Group setName(String name) {
        this.name = name;
        return this;
    }

    @Override
    public String toString() {
        return String.format("Group:[id:%d, name:%s]",id,name);
    }
}
