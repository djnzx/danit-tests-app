package servlets;

import cookies.Cookies;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ServletLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookies c = new Cookies(req);
        c.clearAndSpill("Hello1",resp);
        PrintWriter w = resp.getWriter();
        w.write("Logout servlet\n");
        w.write(c.getValue("Hello")+"\n");
        w.write(c.getValueDecoded("Hello1")+"\n");
    }
}
