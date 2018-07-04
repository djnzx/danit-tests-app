package servlets;

import cookies.CodeEncode;
import logic.Ent;
import logic.InMemory;
import logic.Persistence;
import model.dao.DAOPgUser;
import model.dto.Group;
import model.dto.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import params.Params;
import utils.FreeMarker;
import utils.MessageFormatted;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public class ServletRegister extends HttpServlet {
    public static final String f_p1 = "passwd1";
    public static final String f_p2 = "passwd2";
    public static final String f_lg = "login";
    public static final String f_gr = "group";
    public static final String f_nm = "name";
    private final FreeMarker template;
    private final Persistence persistence;
    static Logger log = LoggerFactory.getLogger(ServletRegister.class);

    public ServletRegister(Persistence persistence, FreeMarker template) {
        this.template=template;
        this.persistence=persistence;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        InMemory<Group> inG = persistence.get(Ent.Group);
        HashMap<String, Object> data = new HashMap<String, Object>(){{
            put("groups", inG.dao().all());
        }};
        template.render("register.html", data, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Params p = new Params(req);
        log.info(p.toString());
        HashMap<String, Object> data = new HashMap<>();
        data.put("name", p.get(f_lg));

        if (p.get(f_p1).equals(p.get(f_p2))) {
            DAOPgUser dao = persistence.get(Ent.User).dao();
            List<User> byLogin = dao.getByLogin(p.get(f_lg));
            if (byLogin.size()==0) {
                // insert
                User store = dao.store(new User(p.get(f_nm), p.get(f_lg), new CodeEncode().encrypt(p.get(f_p1)), p.get(f_gr)));
                template.render("register-ok.html", data, resp);
            } else {
                data.put("message", new MessageFormatted("User already registered, please recall your password or register with another e-mail"));
                template.render("register-err.html", data, resp);
            }
        } else {
            data.put("message", new MessageFormatted("password mismatch"));
            template.render("register-err.html", data, resp);
        }
    }
}
