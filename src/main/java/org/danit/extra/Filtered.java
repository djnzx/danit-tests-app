package org.danit.extra;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import static java.util.stream.Collectors.joining;

public class Filtered {
    private static final Pattern pattern1 = Pattern.compile("#");
    private static final Pattern pattern3 = Pattern.compile("###");
    private static final String IT="item";
    private static final String ITS="items";
    private static final String QU="question";
    private static final String AW="answer";
    private static final String AWS="answers";
    private static final String PATH="./questions";
    private static final String PATTERN="*.txt";
    private static final String OUT_FILE="text.xml";

    private static String escape(String input) {
        return
//                String.format("<![CDATA[%s]]>",input);
        input

                .replace("<", "&lt;")
                .replace(">","&gt")
                .replace("&", "&amp;")
                .replace("\"", "&quot;")
                .replace("'", "&apos;")
                ;
    }

    private static String wrap(String input, String tag) {
        return String.format("<%s>%s</%s>",tag,input,tag);
    }

    public static String process(String input) {
        return pattern3.splitAsStream(input)
                        .map(String::trim)
                        .filter(s -> s.length()>0)
                        .map(s -> wrap(escape(pattern1.splitAsStream(s).map(String::trim).findFirst().get()), QU)
                                + wrap(pattern1.splitAsStream(s).map(String::trim).skip(1).map(s1 -> wrap(escape(s1), AW)).collect(joining()), AWS))
                        .map(s -> wrap(s, IT))
                        .collect(joining("\n"));
    }

    public static void main(String[] args) throws IOException {
        Files.write(
                Paths.get(PATH, OUT_FILE),
                wrap(StreamSupport.stream(
                                Files.newDirectoryStream(
                                        Paths.get(PATH), PATTERN).spliterator(),
                                false)
                                .sorted()
                                .map(path -> {
                                    try { return process(Files.readAllLines(path).stream().collect(joining("\n")));
                                    } catch (IOException e) { return ""; }
                                })
                                .collect(Collectors.joining("\n"))
                        , ITS).getBytes()
        );
    }
}
