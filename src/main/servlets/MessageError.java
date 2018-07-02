package servlets;

public class MessageError implements Message {
    private final String msg;

    public MessageError(String msg) {
        this.msg = msg;
    }

    @Override
    public String get() {
        return this.msg;
    }
}
