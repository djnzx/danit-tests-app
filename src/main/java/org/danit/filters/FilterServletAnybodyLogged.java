package org.danit.filters;

import org.danit.cookies.Session;
import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FilterServletAnybodyLogged implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (!new Session(request).isAnybodyLogged()) {
            ((HttpServletResponse)response).sendRedirect("/login");
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
