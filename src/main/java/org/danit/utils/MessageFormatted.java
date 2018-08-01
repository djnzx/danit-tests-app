package org.danit.utils;

public class MessageFormatted implements Message {
    /**
     * format
     */
    private final String format;
    /**
     * params
     */
    private final Object[] params;

    public MessageFormatted(final String msg) {
        this(msg, new Object[0]);
    }

    public MessageFormatted(final String msg, final Object... params) {
        this.format = msg;
        this.params = params;
    }

    @Override
    public String get() {
        return params.length == 0 ?
                this.format :
                String.format(format, params);
    }

    @Override
    public String toString() {
        return get();
    }
}
