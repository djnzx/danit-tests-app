package cookies;

public class Session {
    public final String cookieUID = "UID";
    private final Cookies cookies;
    private final int howLongLoggedIn = 60*60*24;

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


}
