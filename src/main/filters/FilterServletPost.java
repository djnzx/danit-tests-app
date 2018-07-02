package filters;

import params.Params;
import servlets.ServletRegister;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FilterServletPost implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        if (httpRequest.getMethod().equalsIgnoreCase("POST")
                && !new Params(httpRequest).containsAll(ServletRegister.f_p1, ServletRegister.f_p2, ServletRegister.f_lg, ServletRegister.f_gr, ServletRegister.f_nm)) {
            ((HttpServletResponse)response).sendRedirect("/register");
        } else {
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
