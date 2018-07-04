import core.WholeProcess;
import filters.FilterServletAnybodyLogged;
import filters.FilterServletPostLogin;
import filters.FilterServletPostRegister;
import logic.Persistence;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import servlets.ServletAssets;
import servlets.ServletLogin;
import servlets.ServletLogout;
import servlets.ServletRegister;
import servlets.ServletRedirectTo;
import servlets.ServletTest;
import utils.FreeMarker;

import javax.servlet.DispatcherType;
import java.util.EnumSet;

public class Application {
    public static void main(String[] args) throws Exception {
        FreeMarker template = new FreeMarker("./templates");
        Persistence persistence = new Persistence();
        WholeProcess wholeProcess = new WholeProcess(persistence);
        new Server(8080) {{
            setHandler(new ServletContextHandler(){{
                addServlet(new ServletHolder(new ServletAssets()),"/assets/*");
                addServlet(new ServletHolder(new ServletLogin(wholeProcess, template)),"/login");
                addServlet(new ServletHolder(new ServletLogout(wholeProcess, template)),"/logout");
                addServlet(new ServletHolder(new ServletRegister(persistence, template)),"/register");
                addServlet(new ServletHolder(new ServletTest(wholeProcess, template)),"/test");
                addServlet(new ServletHolder(new ServletRedirectTo("/login")),"/*");
                //addServlet(new ServletHolder(new ServletMenu(template)),"/*");
                addFilter(FilterServletPostRegister.class, "/register", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
                addFilter(FilterServletPostLogin.class, "/login", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
                addFilter(FilterServletAnybodyLogged.class, "/test", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
            }});
            start();
            join();
        }};
    }
}
