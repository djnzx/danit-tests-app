package servlets;

import cookies.Cookies;
import cookies.CookiesEncrypted;
import cookies.Session;
import core.WholeProcess;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import utils.FreeMarker;
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
        Cookies cookies = new CookiesEncrypted(req);
        log.info("WholeProcess was:" + wholeProcess.toString());
        wholeProcess.userLogout(cookies.getValue(Session.cookieUID));
        log.info("WholeProcess  is:" + wholeProcess.toString());
        cookies.die(Session.cookieUID);
        cookies.spill(resp);
        template.render("logout-ok.html", resp);
    }
}
