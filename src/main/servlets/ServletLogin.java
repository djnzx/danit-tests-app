package servlets;

import cookies.CookieTimed;
import cookies.Cookies;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Cookies c = new Cookies();
        c.add(new CookieTimed("Hello","world", 3600));
        c.addEncoded(new CookieTimed("Hello1","world", 3600));
        c.spill(resp);
        PrintWriter w = resp.getWriter();
        w.write("Login servlet");
    }
}
