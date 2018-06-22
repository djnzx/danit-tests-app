package cookies;

import javax.servlet.http.Cookie;

public class CookieTimed extends Cookie {

    public CookieTimed(Cookie c) {
        super(c.getName(), c.getValue());
        //setDomain(c.getDomain());
        setPath(c.getPath());
        setMaxAge(c.getMaxAge());
        setSecure(c.getSecure());
        setComment(c.getComment());
        setVersion(c.getVersion());
    }

    public CookieTimed(String name, String value, int age) {
        super(name, value);
        this.setMaxAge(age);
    }

    @Override
    public String toString() {
        return String.format("Cookie:[name='%s', value='%s', age='%ss']",this.getName(), this.getValue(), this.getMaxAge());
    }
}