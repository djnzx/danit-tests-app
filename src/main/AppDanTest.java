import logic.Persistence;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import servlets.*;
import utils.FreeMarker;

public class AppDanTest {
    public static void main(String[] args) throws Exception {
        FreeMarker template = new FreeMarker("./templates");
        Persistence persistence = new Persistence();
        new Server(8001) {{
            setHandler(new ServletContextHandler(){{
                addServlet(new ServletHolder(new ServletAssets()),"/assets/*");
                addServlet(new ServletHolder(new ServletLogin()),"/login");
                addServlet(new ServletHolder(new ServletLogout()),"/logout");
                addServlet(new ServletHolder(new ServletRegister(persistence, template)),"/register");
                addServlet(new ServletHolder(new ServletMenu(template)),"/*");
                //Arrays.asList("/login").forEach(path -> addFilter(SimpleFilter.class,path, EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST)));
            }});
            start();
            join();
        }};
    }
}
