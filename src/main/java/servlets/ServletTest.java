package servlets;

import cookies.Session;
import core.OneQuestion;
import core.Process;
import core.WholeProcess;
import model.dto.Group;
import model.dto.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import params.Params;
import utils.FreeMarker;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class ServletTest extends HttpServlet {
    private final WholeProcess process;
    private final FreeMarker template;

    static Logger log = LoggerFactory.getLogger(ServletTest.class);

    public ServletTest(WholeProcess process, FreeMarker template) {
        this.process = process;
        this.template = template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // first entrance
        User user = process.user(new Session(req).whoLogged());
        HashMap<String, Object> data = new HashMap<>();
        data.put("user", user);
        data.put("group", process.group(user.getGroupId()));
        template.render("test-first.html", data, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String f_aw = "answer";
        final String f_qu = "question";
        final String PAUSE = "pause";
        final String SKIP = "skip";

        final Params p = new Params(req);
        log.info(p.toString());

        final int loggedUserId = new Session(req).whoLogged();
        final HashMap<String, Object> data = new HashMap<>();
        User user = process.user(loggedUserId);
        Group group = process.group(user.getGroupId());
        data.put("user", user);
        data.put("group", group);

        Process byStudent____ = process.getByStudent(loggedUserId);

        if (p.containsAll(f_aw, f_qu)) {
            String answer = p.get(f_aw);
            if (answer.equalsIgnoreCase(PAUSE)) {
                template.render("test-pause.html", data, resp);
            } else {
                if (answer.equalsIgnoreCase(SKIP)) {
                    byStudent____.skip(p.get(f_qu));
                } else {
                    byStudent____.store(p.get(f_qu), p.get(f_aw));
                }
                nextQuestion(user, byStudent____, data, resp);
            }
        } else {
            nextQuestion(user, byStudent____, data, resp);
        }
    }

    private void nextQuestion(User user, Process process, HashMap<String, Object> data, HttpServletResponse resp) throws IOException {
        if (process.hasNext()) {
            OneQuestion questionWithAnswers = process.next();
            log.trace(questionWithAnswers.toString());
            log.trace(questionWithAnswers.question().textHtml());
            data.put("qanda", questionWithAnswers);
            template.render("test-next.html", data, resp);
        } else {
            log.info(String.format("User %d:%s has finished test", user.getId(), user.getName()));
            template.render("test-done.html", data, resp);
        }
    }
}
