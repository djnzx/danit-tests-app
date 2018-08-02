package org.danit.servlets;

import org.danit.cookies.Session;
import org.danit.core.LearningProcess;
import org.danit.core.WholeProcess;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.danit.params.Params;
import org.danit.utils.FreeMarker;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class ServletTest extends HttpServlet {
    private final WholeProcess process;
    private final FreeMarker template;

    private final String f_aw = "answer";
    private final String f_qu = "question";
    private final String PAUSE = "pause";
    private final String SKIP = "skip";

    private static Logger log = LoggerFactory.getLogger(ServletTest.class);

    public ServletTest(WholeProcess process, FreeMarker template) {
        this.process = process;
        this.template = template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        final Params p = new Params(req);
        log.info(p.toString());

        final LearningProcess personal = process.getByStudent(new Session(req).whoLogged());
        final HashMap<String, Object> data = new HashMap<>();
        data.put("user", personal.user());
        data.put("group", personal.group());
        data.put("remained", personal.remained());

        if (p.containsAll(f_aw, f_qu)) {
            final String qu=p.get(f_qu);
            final String aw=p.get(f_aw);
            if (PAUSE.equals(aw)) {
                template.render("test-pause.html", data, resp);
                return;
            }
            if (SKIP.equals(aw)) {
                personal.skip(qu);
            } else {
                personal.store(qu, aw);
            }
        }
        if (personal.hasNext()) {
            data.put("qanda", personal.next());
        }
        template.render("test.html", data, resp);
    }
}
