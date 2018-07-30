package utils;

import org.slf4j.Logger;
import org.slf4j.event.Level;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Scanner;

public class RequestPrinter {
    private final HttpServletRequest req;

    public RequestPrinter(final HttpServletRequest req) {
        this.req = req;
    }

    public static void main(String[] args) {
        System.out.print(Colored.build("Hello:", Ansi.FColor.GREEN));
        System.out.print("default");
        System.out.print(Colored.build("World", Ansi.FColor.RED));
        System.out.println();
    }

    public String getAllHeaders() {
        StringBuilder sb = new StringBuilder(Colored.build("ALL HEADERS:\n", Ansi.Attribute.BOLD, Ansi.FColor.GREEN));
        Enumeration<String> headers = req.getHeaderNames();
        while (headers.hasMoreElements()) {
            String name = headers.nextElement();
            sb
                    .append(name)
                    .append(": ")
                    .append(Colored.build(req.getHeader(name), Ansi.FColor.GREEN))
                    .append("\n");
        }
        return sb.toString();
    }

    public String getAllParams() {
        StringBuilder sb = new StringBuilder(Colored.build("ALL PARAMS:\n", Ansi.Attribute.BOLD, Ansi.FColor.RED));
        Enumeration<String> params = req.getParameterNames();
        while (params.hasMoreElements()) {
            String name = params.nextElement();
            sb
                    .append(name)
                    .append("=")
                    .append(Colored.build(req.getParameter(name), Ansi.FColor.RED))
                    .append("\n");
        }
        return sb.toString();
    }

    public String getAllBody() throws IOException {
        StringBuilder sb = new StringBuilder(Colored.build("BODY:\n",  Ansi.Attribute.BOLD, Ansi.FColor.YELLOW));
        try (Scanner s = new Scanner(req.getInputStream(), "UTF-8").useDelimiter("\\A");) {
            while (s.hasNext()) {
                sb.append(s.nextLine())
                        .append("\n");
            }
        }
        return sb.toString();
    }

    public String getAll() throws IOException {
        return String.join("", getAllHeaders(), getAllParams(), getAllBody());
    }

    public void printAll() throws IOException {
        System.out.println(getAll());
    }

    public void printAll(Logger log) throws IOException {
        printAll(log, Level.INFO);
    }

    public void printAll(Logger log, Level lvl) throws IOException {
        String data = getAll();
        switch (lvl) {
            case ERROR: log.error(data);
                break;
            case WARN: log.warn(data);
                break;
            case INFO: log.info(data);
                break;
            case DEBUG: log.debug(data);
                break;
            case TRACE: log.trace(data);
                break;
        }
    }
}
