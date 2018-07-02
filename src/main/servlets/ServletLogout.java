package servlets;

import cookies.CookiesStandard;
import utils.FreeMarker;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletLogout extends HttpServlet {
    private final FreeMarker template;

    public ServletLogout(FreeMarker template) {
        this.template = template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        new CookiesStandard(req).dieAll().spill(resp);
        template.render("logout-ok.html", resp);
    }
}
