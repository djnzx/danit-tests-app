package utils;

public class Colored {

    public static String build(Object msg, Ansi.FColor fg) {
        return build(msg, Ansi.Attribute.NONE, fg, Ansi.BColor.NONE);
    }

    public static String build(Object msg, Ansi.Attribute attr, Ansi.FColor fg) {
        return build(msg, attr, fg, Ansi.BColor.NONE);
    }

    public static String build(Object msg, Ansi.Attribute attr, Ansi.FColor fg, Ansi.BColor bg) {
        return String.join("",
                Ansi.PREFIX,
                attr.code(), Ansi.SEPARATOR,
                fg.code(), Ansi.SEPARATOR,
                bg.code(), Ansi.POSTFIX,
                msg.toString(),
                Ansi.PREFIX,
                Ansi.Attribute.NONE.code(), Ansi.SEPARATOR,
                Ansi.FColor.NONE.code(), Ansi.SEPARATOR,
                Ansi.BColor.NONE.code(), Ansi.POSTFIX,
                ""
        );
    }
}
