package org.danit.servlets;

import org.danit.core.WholeProcess;
import org.danit.model.dto.Stat001;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.danit.utils.FreeMarker;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class ServletStat extends HttpServlet {
    private final WholeProcess wholeProcess;
    private final FreeMarker template;
    static Logger log = LoggerFactory.getLogger(ServletStat.class);

    public ServletStat(WholeProcess wholeProcess, FreeMarker template) {
        this.wholeProcess = wholeProcess;
        this.template = template;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, Object> data = new HashMap<>();
        List<Stat001> stat001s = wholeProcess.statDAO().stat001();
        data.put("lines",stat001s);
        template.render("stat001.html", data, resp);
        log.info(stat001s.toString());
    }
}
