package servlets;

import cookies.*;
import logic.Ent;
import logic.Persistence;
import model.dao.DAOPgUser;
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
import java.util.List;

public class ServletLogin extends HttpServlet {
    private final FreeMarker template;
    private final Persistence persistence;
    public static final String f_pw = "passwd";
    public static final String f_lg = "login";

    static Logger log = LoggerFactory.getLogger(ServletLogin.class);

    public ServletLogin(Persistence persistence, FreeMarker template) {
        this.persistence=persistence;
        this.template=template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        template.render("login.html", resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Params p = new Params(req);
        log.info(p.toString());

        HashMap<String, Object> data = new HashMap<>();
        String userLogin = p.get(f_lg);
        DAOPgUser dao = persistence.get(Ent.User).dao();
        List<User> byLogin = dao.getByLogin(userLogin);
        if (byLogin.isEmpty()) {
            data.put("message", new MessageError("Entered email (%s) not found in database", userLogin));
            template.render("login-err.html", data ,resp);
        } else if (byLogin.size()>1) {
            data.put("message", new MessageError("Looks like you entered only part of your email (%s) because too many matching records found in database", userLogin));
            template.render("login-err.html", data ,resp);
        } else {
            User u = byLogin.get(0);
            // only one record
            if (u.getPasswd().equals(new CodeEncode().encrypt(p.get(f_pw)))) {
                new Session().loginUser(u.getId()).spill(resp);
                data.put("user", u);
                template.render("login-ok.html", data, resp);
            } else {
                data.put("message", new MessageError("Entered password don't match, try again"));
                template.render("login-err.html", data, resp);
            }
        }
    }
}
