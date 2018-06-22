package servlets;

import cookies.CookieTimed;
import cookies.Cookies;
import cookies.CookiesEncrypted;
import cookies.CookiesStandard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

public class ServletLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Cookies cs = new CookiesStandard(req);
        Cookies ce = new CookiesEncrypted(req);

        if (cs.exists("A1")) cs.die("A1");
        if (cs.exists("A2")) cs.die("A2");
        if (cs.exists("X1")) cs.die("X1");
        if (cs.exists("X2")) cs.die("X2");

        if (ce.exists("X1")) cs.die("X1");
        if (ce.exists("X1")) cs.die("X2");
        cs.spill(resp);

        PrintWriter w = resp.getWriter();
        w.write("Logout servlet\n");
        Arrays.asList("A1", "A2", "X1", "X2").forEach(s -> w.write("std:" + s + ":" + (cs.exists(s) ? cs.get(s).toString() : " n/a") + "\n"));
        Arrays.asList("X1", "X2")            .forEach(s -> w.write("std:" + s + ":" + (ce.exists(s) ? ce.get(s).toString() : " n/a") + "\n"));
    }
}
