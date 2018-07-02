package cookies;

public class Session {
    public final String cookieUID = "UID";
    private final Cookies cookies;

    public Session(Cookies cookies) {
        this.cookies = cookies;
    }

    public boolean isAnybodyLogged() {
        return cookies.exists(cookieUID);
    }

    public int whoLogged() {
        return Integer.parseInt(cookies.getValue(cookieUID).toString());
    }
}
