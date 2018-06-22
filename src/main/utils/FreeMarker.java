package utils;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Map;

public class FreeMarker {
    private final Configuration config = new Configuration(Configuration.VERSION_2_3_28);

    public FreeMarker(String path) throws IOException {
        config.setDirectoryForTemplateLoading(new File(path));
        config.setDefaultEncoding(String.valueOf(StandardCharsets.UTF_8));
        config.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        config.setLogTemplateExceptions(false);
        config.setWrapUncheckedExceptions(true);
    }

    public void render(String templateFile, Map<String, Object> data, HttpServletResponse resp) throws IOException {
        try {
            config.getTemplate(templateFile).process(data, resp.getWriter());
        } catch (TemplateException e) {
            e.printStackTrace();
        }
    }
}
