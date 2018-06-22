package cookies;

import javax.servlet.http.Cookie;

public class CookieTimed extends Cookie {
    public CookieTimed(String name, String value, int age) {
        super(name, value);
        this.setMaxAge(age);
    }
}
