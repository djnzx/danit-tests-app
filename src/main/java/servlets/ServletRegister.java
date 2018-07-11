package servlets;

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

public class ServletRegister extends HttpServlet {
    public static final String f_p1 = "passwd1";
    public static final String f_p2 = "passwd2";
    public static final String f_lg = "login";
    public static final String f_gr = "group";
    public static final String f_nm = "name";
    private final WholeProcess wholeProcess;
    private final FreeMarker template;
    static Logger log = LoggerFactory.getLogger(ServletRegister.class);

    /**
     *
     * @param wp
     * @param tpl
     */
    public ServletRegister(final WholeProcess wp, final FreeMarker tpl) {
        this.wholeProcess = wp;
        this.template = tpl;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HashMap<String, Object> data = new HashMap<String, Object>(){{
            put("groups", wholeProcess.groups());
        }};
        template.render("register.html", data, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Params p = new Params(req);
        log.info(p.toString());
        Authenticator.Result r = wholeProcess.register(p.get(f_lg), p.get(f_p1), p.get(f_p2), p.get(f_nm), p.get(f_gr));
        HashMap<String, Object> data = new HashMap<>();
        data.put("name", p.get(f_lg));
        data.put("message", r.message());
        template.render(r.success() ? "register-ok.html" : "register-err.html", data, resp);
    }
}
