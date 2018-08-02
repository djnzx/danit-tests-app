package org.danit;

import org.alexr.trace.filter.FilterServletPrinter;
import org.danit.core.WholeProcess;
import org.danit.filters.FilterServletAnybodyLogged;
import org.danit.filters.FilterServletPostLogin;
import org.danit.filters.FilterServletPostRegister;
import org.danit.logic.Persistence;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
//import org.springframework.web.filter.DelegatingFilterProxy;
import org.danit.servlets.ServletAssets;
import org.danit.servlets.ServletLogin;
import org.danit.servlets.ServletLogout;
import org.danit.servlets.ServletRedirectTo;
import org.danit.servlets.ServletRegister;
import org.danit.servlets.ServletStat;
import org.danit.servlets.ServletTest;
import org.danit.utils.FreeMarker;

import javax.servlet.DispatcherType;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashSet;

//import static org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer.DEFAULT_FILTER_NAME;

public class Application {
    public static void main(String[] args) throws Exception {
        FreeMarker template = new FreeMarker("./templates");
        WholeProcess wholeProcess = new WholeProcess(new Persistence());
        new Server(8080) {{
            setHandler(new ServletContextHandler(){{
                addServlet(ServletAssets.class, "/assets/*");
                //addServlet(new ServletHolder(new ServletAssets()), "/assets/*");
                addServlet(new ServletHolder(new ServletLogin(wholeProcess, template)), "/login");
                addServlet(new ServletHolder(new ServletLogout(wholeProcess, template)), "/logout");
                addServlet(new ServletHolder(new ServletRegister(wholeProcess, template)), "/register");
                addServlet(new ServletHolder(new ServletTest(wholeProcess, template)), "/test");
                addServlet(new ServletHolder(new ServletStat(wholeProcess, template)), "/stat");
                addServlet(new ServletHolder(new ServletRedirectTo("/login")), "/*");
                addFilter(FilterServletPostRegister.class, "/register", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
                addFilter(FilterServletPostLogin.class, "/login", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
                addFilter(FilterServletAnybodyLogged.class, "/test", EnumSet.of(DispatcherType.INCLUDE, DispatcherType.REQUEST));
                //addFilter(FilterServletPrinter.class, "/*", EnumSet.of(DispatcherType.REQUEST));
                //addFilter(new FilterHolder(new DelegatingFilterProxy(DEFAULT_FILTER_NAME)), "/*", EnumSet.allOf(DispatcherType.class));
                // https://stackoverflow.com/questions/30927761/embedded-jetty-doesnt-recognise-spring-mvc-security
                // https://stackoverflow.com/questions/19718159/java-lang-illegalstateexception-no-sessionmanager/19718918#19718918
            }});
            start();
            join();
        }};
    }
}
