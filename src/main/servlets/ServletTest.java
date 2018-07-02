package servlets;

import logic.Persistence;
import utils.FreeMarker;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class ServletTest extends HttpServlet {
    private final Persistence persistence;
    private final FreeMarker template;

    public ServletTest(Persistence persistence, FreeMarker template) {
        this.persistence = persistence;
        this.template = template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, Object> data = new HashMap<>();
        data.put("message", new MessageError("GET Method"));
        template.render("test.html", data, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, Object> data = new HashMap<>();
        data.put("message", new MessageError("POST Method"));
        template.render("test.html", data, resp);
    }
}
