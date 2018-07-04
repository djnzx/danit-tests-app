package utils;

public class MessageFormatted implements Message {
    private final String msg;
    private final Object[] params;

    public MessageFormatted(String msg) {
        this(msg, new Object[0]);
    }

    public MessageFormatted(String msg, Object... params) {
        this.msg=msg;
        this.params=params;
    }

    @Override
    public String get() {
        return params.length==0 ?
                this.msg :
                String.format(msg, params);
    }

    @Override
    public String toString() {
        return get();
    }
}
