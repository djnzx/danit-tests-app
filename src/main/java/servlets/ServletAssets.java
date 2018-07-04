package servlets;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ServletAssets extends HttpServlet {
    static Logger log = LoggerFactory.getLogger(ServletAssets.class);
    private final String ASSETS_ROOT = "./assets";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        log.debug(req.getPathInfo());
        Files.copy(Paths.get(ASSETS_ROOT, req.getPathInfo()), resp.getOutputStream());
    }
}
