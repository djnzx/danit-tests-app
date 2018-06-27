package servlets;

import logic.Ent;
import logic.InMemory;
import logic.Persistence;
import model.dao.DAO;
import model.dto.AbstractEntity;
import model.dto.Group;
import org.eclipse.jetty.servlet.Source;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import sun.rmi.transport.ObjectTable;
import utils.FreeMarker;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ServletRegister extends HttpServlet {
    private final FreeMarker template;
    private final Persistence persistence;
    static Logger log = LoggerFactory.getLogger(ServletRegister.class);

    public ServletRegister(Persistence persistence, FreeMarker template) {
        this.template=template;
        this.persistence=persistence;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        InMemory<Group> inG = persistence.get(Ent.Group);
        HashMap<String, Object> data = new HashMap<>();
        data.put("groups", inG.dao().all());
        template.render("register.html", data, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter w = resp.getWriter();
        Map<String, String[]> params = req.getParameterMap();
        log.info(params.toString());

        w.write("POST process");

    }
}
