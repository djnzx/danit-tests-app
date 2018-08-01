package org.danit.params;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Map;

public class Params {
    private final Map<String, String[]> params;

    public Params(ServletRequest req) {
        this((HttpServletRequest)req);
    }

    public Params(HttpServletRequest req) {
        this(req.getParameterMap());
    }

    public Params(Map<String, String[]> params) {
        this.params = params;
    }

    public boolean containsKey(String key) {
        return params.containsKey(key);
    }

    public boolean containsValue(String key) {
        String[] ss = params.get(key);
        return (ss.length>0) && (!ss[0].isEmpty());
    }

    public boolean containsAll(String... keys) {
        boolean result = true;
        for (String s : keys) {
            result = result && containsKey(s) && containsValue(s);
        }
        return result;
    }

    public String get(String key) {
        return params.get(key)[0];
    }

    @Override
    public String toString() {
        return params.toString();
    }
}
