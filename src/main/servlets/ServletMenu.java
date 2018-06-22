package servlets;

import cookies.CookieTimed;
import cookies.Cookies;
import cookies.CookiesEncrypted;
import cookies.CookiesStandard;
import utils.FreeMarker;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;

public class ServletMenu extends HttpServlet {
    private final FreeMarker template;

    public ServletMenu(FreeMarker template) {
        this.template=template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Cookies cs = new CookiesStandard(req);
        Cookies ce = new CookiesEncrypted(cs);
        template.render("menu.html", new HashMap<>(), resp);
        PrintWriter w = resp.getWriter();

        Arrays.asList("A1", "A2", "X1", "X2").forEach(s -> w.write("std:" + s + ":" + (cs.exists(s) ? cs.get(s).toString() : " n/a") + "<br>"));
        Arrays.asList("X1", "X2")            .forEach(s -> w.write("std:" + s + ":" + (ce.exists(s) ? ce.get(s).toString() : " n/a") + "<br>"));
    }
}
