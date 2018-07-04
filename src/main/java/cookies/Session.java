package cookies;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

public class Session {
    public static final String cookieUID = "UID";
    private final Cookies cookies;
    private final int howLongLoggedIn = 60*60*24;

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

    public Cookies loginUser(int id) {
        cookies.add(new CookieTimed(cookieUID, String.valueOf(id), howLongLoggedIn));
        return cookies;
    }

    public Cookies logout() {
        return cookies.dieAll();
    }
}
