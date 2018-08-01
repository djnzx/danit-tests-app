package org.danit.cookies;

import javax.servlet.http.Cookie;

@SuppressWarnings("PMD.OnlyOneConstructorShouldDoInitialization")
public final class CookieTimed extends Cookie {

    @SuppressWarnings("PMD.ConstructorOnlyInitializesOrCallOtherConstructors")
    public CookieTimed(final Cookie c) {
        super(c.getName(), c.getValue());
        setPath(c.getPath());
        setMaxAge(c.getMaxAge());
        setSecure(c.getSecure());
        setComment(c.getComment());
        setVersion(c.getVersion());
    }

    @SuppressWarnings("PMD.ConstructorOnlyInitializesOrCallOtherConstructors")
    public CookieTimed(final String name, final String value, final int age) {
        super(name, value);
        this.setMaxAge(age);
    }

    @Override
    public String toString() {
        return String.format("Cookie:[name='%s', value='%s', age='%ss']", this.getName(), this.getValue(), this.getMaxAge());
    }
}