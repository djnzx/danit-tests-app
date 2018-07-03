package servlets;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ServletRedirectTo extends HttpServlet {
    private final String redirectTo;

    public ServletRedirectTo(String path) {
        redirectTo=path;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(redirectTo);
    }
}
