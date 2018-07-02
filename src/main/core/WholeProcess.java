package core;

import java.util.HashMap;

public class WholeProcess {
    private final HashMap<Integer, Process> storage = new HashMap<>();

    public Process getByStudent(int id) {
        if (!storage.containsKey(id)) {
            // load it from db
        }
        return storage.get(id);
    }

    void userLogin(int id) {
        // load from db
        Process process = new ProcessPersonalized();
        storage.put(id, process);
    }

    void userLogout(int id) {
        storage.remove(id);
    }
}
