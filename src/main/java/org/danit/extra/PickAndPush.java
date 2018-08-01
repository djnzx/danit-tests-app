package org.danit.extra;

import org.danit.model.PgDatabase;
import org.danit.model.dao.DAOPgAnswer;
import org.danit.model.dao.DAOPgQuestion;
import org.danit.model.dto.Answer;
import org.danit.model.dto.Question;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

public class PickAndPush {
    private static final Pattern pattern1 = Pattern.compile("#");
    private static final Pattern pattern3 = Pattern.compile("###");
    private static final Pattern pattern2 = Pattern.compile("\n");
    private static final String PATH="./questions";
    private static final String PATTERN="*.txt";

    private static final PgDatabase db = new PgDatabase();
    private static final DAOPgQuestion daoQu = new DAOPgQuestion(db);
    private static final DAOPgAnswer daoAnsw = new DAOPgAnswer(db);

    private static void processQuestion(String input) {
        ArrayList<String> lines = new ArrayList<>(Arrays.asList(input.split("\n")));
        String line0 = lines.get(0);
        // number
        String qNumber="0"+line0.substring(0,3);
        // header
        String qHeader=line0.substring(4,line0.length());
        lines.remove(0);
        String linesWo1 = lines.stream().collect(Collectors.joining("\n"));
        // body
        String qBody = pattern1.splitAsStream(linesWo1).limit(1).findFirst().get();
        Question inserted = daoQu.insert(new Question(qNumber, qHeader, qBody));
        int qId = inserted.getId();
        List<String> qAnswers = pattern1.splitAsStream(linesWo1).skip(1).map(String::trim).collect(Collectors.toList());
        qAnswers.forEach(s -> daoAnsw.insert(new Answer(qId, s)));
    }

    private static void processEachFile(Path path) {
        String allFile = "";
        try {
            allFile = new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
        } catch (IOException e) {}
        pattern3.splitAsStream(allFile)
                .map(String::trim)
                .filter(s -> s.length()>0)
                .forEach(PickAndPush::processQuestion);
    }

    public static void main(String[] args) throws IOException {
        StreamSupport.stream(
                Files.newDirectoryStream(
                        Paths.get(PATH), PATTERN).spliterator(),
                false)
                .sorted()
                .forEach(PickAndPush::processEachFile);
    }
}
