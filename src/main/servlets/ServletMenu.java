package servlets;

import utils.FreeMarker;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class ServletMenu extends HttpServlet {
    private final FreeMarker template;

    public ServletMenu(FreeMarker template) {
        this.template=template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        template.render("menu.html", new HashMap<>(), resp);
    }
}
