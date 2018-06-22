package cookies;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.function.Function;
import java.util.stream.Collectors;

public class Cookies {
    private final Map<String, Cookie> cookies;
    private final CodeEncode cc=new CodeEncode();

    public Cookies() {
        this(new Cookie[]{});
    }

    public Cookies(ServletRequest request) {
        this((HttpServletRequest)request);
    }

    public Cookies(HttpServletRequest req) {
        this(req.getCookies());
    }

    public Cookies(Cookie[] cookies) {
        this.cookies = new NullableArrayWrapper<>(cookies)
                .get()
                .stream()
                .collect(Collectors.toMap(Cookie::getName, Function.identity()));
    }

    public boolean exists(String name) {
        return cookies.containsKey(name);
    }

    public Cookie get(String name) {
        return cookies.get(name);
    }

    public String getValue(String name) {
        return cookies.containsKey(name) ? get(name).getValue() : "";
    }

    public String getValueDecoded(String name) {
        return cookies.containsKey(name) ? cc.decrypt(get(name).getValue()) : "";
    }

    public int getAge(String name) {
        return cookies.get(name).getMaxAge();
    }

    public void add(Cookie c) {
        cookies.put(c.getName(), c);
    }

    public void addEncoded(Cookie c) {
        c.setValue(cc.encrypt(c.getValue()));
        add(c);
    }

    public boolean clear(String name) {
        if (exists(name)) {
            get(name).setMaxAge(0);
            return true;
        }
        return false;
    }

    public void clearAndSpill(String name, HttpServletResponse resp) {
        if (clear(name)) {
            resp.addCookie(get(name));
        }
    }

    public void spill(HttpServletResponse resp) {
        cookies.forEach((s, cookie) -> resp.addCookie(cookie));
    }

    public static void main(String[] args) {
        Cookie c2 = new Cookie("1", "2");
        Cookie c1 = new CookieTimed("login", "alex", 60);
        Cookie[] cc =null;
        Cookies cookies = new Cookies(cc);
        System.out.println(cookies.getValue("login"));
    }
}
