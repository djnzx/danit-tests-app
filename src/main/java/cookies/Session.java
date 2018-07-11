package cookies;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Session {
    private static final String COOKIE_UID = "UID";
    private final Cookies cookies;
    private final int HOW_LONG = 60*60*24;

    public Session(final ServletRequest req) {
        this((HttpServletRequest)req);
    }

    public Session(final HttpServletRequest req) {
        this(new CookiesEncrypted(req));
    }

    public Session() {
        this(new CookiesEncrypted());
    }

    public Session(final Cookies ck) {
        this.cookies = ck;
    }

    public boolean isAnybodyLogged() {
        return cookies.exists(COOKIE_UID);
    }

    public int whoLogged() {
        return Integer.parseInt(cookies.getValue(COOKIE_UID).toString());
    }

    public Session loginUser(final int id) {
        cookies.add(new CookieTimed(COOKIE_UID, String.valueOf(id), HOW_LONG));
        return this;
    }

    /**
     * logging out user by setting up MaxAge(0)
     * inn order to make result, should be used with save(HttpServletResponse)
     * for example: s.logout().save(resp);
     * @return this for chaining and ability to use .save() in the future
     */
    public Session logout() {
        cookies.die(Session.COOKIE_UID);
        return this;
    }

    /**
     * saves cookies to HttpServletResponse
     * @param resp, where to cookies will be written
     */
    public void save(final HttpServletResponse resp) {
        cookies.spill(resp);
    }
}
