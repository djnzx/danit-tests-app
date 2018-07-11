package cookies;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public final class CookiesEncrypted implements Cookies {

    /**
     * logger instance
     */
    private static final Logger LOG = LoggerFactory.getLogger(CookiesEncrypted.class);

    /**
     * coder instance to code/decode cookies
     */
    private final EncodeDecode coder;
    /**
     * origin cookies
     */
    private final Cookies cookies;

    public CookiesEncrypted() {
        this(new CookiesStandard());
    }

    public CookiesEncrypted(final HttpServletRequest req) {
        this(new CookiesStandard(req));
    }

    public CookiesEncrypted(final Cookies ck) {
        this.cookies = ck;
        this.coder = new EncodeDecode();
    }

    @Override
    public boolean exists(final CharSequence name) {
        return cookies.exists(name);
    }

    @Override
    /**
     * transparent decoding
     */
    public Cookie get(final CharSequence name) {
        final Cookie c = (Cookie) cookies.get(name).clone(); // Cookie is mutable !!!;
        LOG.trace("GET: encoded:" + c);
        c.setValue(coder.decrypt(c.getValue()));
        LOG.trace("GET: decoded:" + c);
        return c;
    }

    @Override
    /**
     * transparent decoding
     */
    public CharSequence getValue(final CharSequence name) {
        return get(name).getValue();
    }

    /**
     * transparent coding
     */
    @Override
    public void add(final Cookie c) {
        final Cookie cc = (Cookie) c.clone(); // Cookie is mutable !!!
        LOG.trace(String.format("ADD: before coding:%s", cc));
        cc.setValue(coder.encrypt(cc.getValue()));
        LOG.trace(String.format("ADD: after  coding:%s", cc));
        cookies.add(cc);
        LOG.trace(String.format("ADD: value put    :%s", cc));
    }

    @Override
    public void remove(final CharSequence name) {
        cookies.remove(name);
    }

    @Override
    public void spill(final HttpServletResponse response) {
        cookies.spill(response);
    }

    @Override
    public List<Cookie> all() {
        return cookies.all();
    }

    @Override
    public void die(final CharSequence name) {
        cookies.die(name);
    }
}