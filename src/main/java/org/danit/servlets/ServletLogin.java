package org.danit.servlets;

import org.danit.cookies.Session;
import org.danit.core.Authenticator;
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
import java.util.Properties;
import java.util.ResourceBundle;

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
        Authenticator.Result r = wholeProcess.auth(p.get(f_lg), p.get(f_pw));
        if (r.success()) {
            new Session().loginUser(r.user().getId()).save(resp);
        }
        HashMap<String, Object> data = new HashMap<>();
        data.put("user", r.user());
        data.put("message", r.message());
        template.render(r.success() ? "login-ok.html" : "login-err.html", data, resp);
    }
}
