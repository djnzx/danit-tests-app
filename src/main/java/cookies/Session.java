package cookies;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Session {
    private static final String cookieUID = "UID";
    private final Cookies cookies;
    private final int HOW_LONG = 60*60*24;

    public Session(ServletRequest req) {
        this((HttpServletRequest)req);
    }

    public Session(HttpServletRequest req) {
        this(new CookiesEncrypted(req));
    }

    public Session() {
        this(new CookiesEncrypted());
    }

    public Session(Cookies cookies) {
        this.cookies = cookies;
    }

    public boolean isAnybodyLogged() {
        return cookies.exists(cookieUID);
    }

    public int whoLogged() {
        return Integer.parseInt(cookies.getValue(cookieUID).toString());
    }

    public Session loginUser(int id) {
        cookies.add(new CookieTimed(cookieUID, String.valueOf(id), HOW_LONG));
        return this;
    }

    public Session logout() {
        cookies.die(Session.cookieUID);
        return this;
    }

    public void save(HttpServletResponse resp) {
        cookies.spill(resp);
    }
}
