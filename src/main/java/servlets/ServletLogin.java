package servlets;

import cookies.Session;
import core.Authenticator;
import core.WholeProcess;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import params.Params;
import utils.FreeMarker;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class ServletLogin extends HttpServlet {
    private final FreeMarker template;
    private final WholeProcess wholeProcess;
    public static final String f_pw = "passwd";
    public static final String f_lg = "login";

    static Logger log = LoggerFactory.getLogger(ServletLogin.class);

    public ServletLogin(WholeProcess wholeProcess, FreeMarker template) {
        this.wholeProcess = wholeProcess;
        this.template = template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        template.render("login.html", resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Params p = new Params(req);
        log.info(p.toString());

        HashMap<String, Object> data = new HashMap<>();
        Authenticator.AuthResult result = wholeProcess.auth(p.get(f_lg), p.get(f_pw));
        if (result.isOk()) {
            new Session().loginUser(result.user().getId()).spill(resp);
            data.put("user", result.user());
            template.render("login-ok.html", data, resp);
        } else {
            data.put("message", result.message());
            template.render("login-err.html", data, resp);
        }
    }
}
