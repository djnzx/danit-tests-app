package servlets;

import cookies.CookieTimed;
import cookies.Cookies;
import cookies.CookiesEncrypted;
import cookies.CookiesStandard;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Cookies cs = new CookiesStandard();
        cs.add(new CookieTimed("A1","V1", 111));
        cs.add(new CookieTimed("A2","V2", 112));

        Cookies ce = new CookiesEncrypted(new CookiesStandard());
        ce.add(new CookieTimed("X1","Y1", 211));
        ce.add(new CookieTimed("X2","Y2", 212));

        cs.spill(resp);
        ce.spill(resp);

        PrintWriter w = resp.getWriter();
        w.write("Login servlet");
    }
}
