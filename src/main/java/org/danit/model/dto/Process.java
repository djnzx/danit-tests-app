package org.danit.model.dto;

import java.sql.Timestamp;

public class Process extends AbstractEntity {
    private int user;
    private int question;
    private int answer;
    private Timestamp date;

    public Process() {
    }

    public Process(int user, int question, int answer) {
        this.user = user;
        this.question = question;
        this.answer = answer;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getQuestion() {
        return question;
    }

    public void setQuestion(int question) {
        this.question = question;
    }

    public int getAnswer() {
        return answer;
    }

    public void setAnswer(int answer) {
        this.answer = answer;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return isEmpty() ? "Process:[EMPTY]" : String.format("Process:[id:%d, user:%d, qu:%d, aw:%d, date:%s]",id,user,question,answer,date.toString());
    }
}
