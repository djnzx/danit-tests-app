import filters.FilterServletPostLogin;
import filters.FilterServletPostRegister;
import logic.Persistence;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import servlets.*;
import utils.FreeMarker;

import javax.servlet.DispatcherType;
import java.util.EnumSet;

public class AppDanTest {
    public static void main(String[] args) throws Exception {
        FreeMarker template = new FreeMarker("./templates");
        Persistence persistence = new Persistence();
        new Server(8080) {{
            setHandler(new ServletContextHandler(){{
                addServlet(new ServletHolder(new ServletAssets()),"/assets/*");
                addServlet(new ServletHolder(new ServletLogin(persistence, template)),"/login");
                addServlet(new ServletHolder(new ServletLogout(template)),"/logout");
                addServlet(new ServletHolder(new ServletRegister(persistence, template)),"/register");
                addServlet(new ServletHolder(new ServletMenu(template)),"/*");
                addFilter(FilterServletPostRegister.class, "/register", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
                addFilter(FilterServletPostLogin.class, "/login", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
            }});
            start();
            join();
        }};
    }
}
