package org.danit.model.dto;

import java.util.stream.Stream;

public class Stat001 {
    private final int studentId;
    private final String studentName;
    private final String groupName;
    private final int amountAnswered;

    public Stat001(int studentId, String studentName, String groupName, int amountAnswered) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.groupName = groupName;
        this.amountAnswered = amountAnswered;
    }

    public int getStudentId() {
        return studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getGroupName() {
        return groupName;
    }

    public int getAmountAnswered() {
        return amountAnswered;
    }

    @Override
    public String toString() {
        return String.format("Stat001:[stId:`%d`, stName:`%s`=', grName:`%s`, processed:`%d`]", studentId, studentName, groupName, amountAnswered);
    }
}
