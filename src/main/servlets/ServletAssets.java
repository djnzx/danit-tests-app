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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        log.info(req.getPathInfo());
        resp.getOutputStream().write(Files.readAllBytes(
                Paths.get("./assets", req.getPathInfo())));

    }
}
