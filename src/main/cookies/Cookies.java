package cookies;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;

public interface Cookies extends Iterable<Cookie> {
    boolean exists(final CharSequence name);
    Cookie get(final CharSequence name);
    CharSequence getValue(final CharSequence name);
    void add(final Cookie c);
    void remove(final CharSequence name);
    void spill(final HttpServletResponse response);
    List<Cookie> all();
    void die(final CharSequence name);
    default Iterator<Cookie> iterator() {
        return all().iterator();
    }
    default void dieAll() {
        all().forEach(c->c.setMaxAge(0));
    }
}
