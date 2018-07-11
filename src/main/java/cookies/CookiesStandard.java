package cookies;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

public class CookiesStandard implements Cookies {
    private static final Logger LOG = LoggerFactory.getLogger(CookiesStandard.class);

    private final Map<CharSequence, Cookie> storage;

    public CookiesStandard() {
        this(new Cookie[]{});
    }

    public CookiesStandard(final ServletRequest request) {
        this((HttpServletRequest) request);
    }

    public CookiesStandard(final HttpServletRequest req) {
        this(req.getCookies());
    }

    public CookiesStandard(final Cookie[] cookies) {
        this.storage = new NullableArrayWrapper<>(cookies)
                .get()
                .stream()
                .collect(Collectors.toMap(Cookie::getName,
                        (Function<Cookie, CookieTimed>) cookie -> new CookieTimed(cookie)
                ));
    }

    @Override
    public boolean exists(final CharSequence name) {
        return storage.containsKey(name);
    }

    @Override
    public Cookie get(final CharSequence name) {
        return storage.get(name);
    }

    @Override
    public CharSequence getValue(final CharSequence name) {
        return storage.get(name).getValue();
    }

    @Override
    public void add(final Cookie c) {
        storage.put(c.getName(), c);
    }

    @Override
    public void remove(final CharSequence name) {
        if (storage.containsKey(name)) {
            final Cookie c = storage.get(name);
            c.setMaxAge(0);
            storage.put(name, c);
        }
    }

    @Override
    public void spill(final HttpServletResponse response) {
        LOG.trace("entering CookiesStandard spill");
        storage.forEach((name, cookie) -> response.addCookie(cookie));
        LOG.trace("leaving CookiesStandard spill");
    }

    @Override
    public List<Cookie> all() {
        return storage.entrySet().stream().map(Map.Entry::getValue).collect(Collectors.toList());
    }

    @Override
    public void die(final CharSequence name) {
        storage.get(name).setMaxAge(0);
    }
}
