package org.danit.servlets;

import org.danit.cookies.Session;
import org.danit.core.WholeProcess;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.danit.utils.FreeMarker;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletLogout extends HttpServlet {
    private final WholeProcess wholeProcess;
    private final FreeMarker template;

    static Logger log = LoggerFactory.getLogger(ServletLogout.class);

    public ServletLogout(WholeProcess wholeProcess, FreeMarker template) {
        this.wholeProcess=wholeProcess;
        this.template = template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Session s = new Session(req);
        log.info("WholeProcess was:" + wholeProcess.toString());
        wholeProcess.userLogout(s.whoLogged());
        log.info("WholeProcess  is:" + wholeProcess.toString());
        s.logout().save(resp);
        template.render("logout-ok.html", resp);
    }
}
