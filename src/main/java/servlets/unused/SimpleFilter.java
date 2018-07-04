package servlets.unused;

import javax.servlet.*;
import java.io.IOException;
import java.io.PrintWriter;

public class SimpleFilter implements javax.servlet.Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");

        PrintWriter w = response.getWriter();
        w.write("АБВГДЕЙКА ABCDEFGHIJKLMNOP!!!\n");

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
