package model.dto;

import java.sql.Timestamp;

public class Question extends AbstractEntity {
    private String number;
    private String header;
    private String text;
    private Timestamp date;

    public Question(){}

    public Question(String number, String header, String text) {
        this.number = number;
        this.header = header;
        this.text = text;
    }

    public String getNumber() {
        return number;
    }

    public Question setNumber(String number) {
        this.number = number;
        return this;
    }

    public String getHeader() {
        return header;
    }

    public Question setHeader(String header) {
        this.header = header;
        return this;
    }

    public String getText() {
        return text;
    }

    public Question setText(String text) {
        this.text = text;
        return this;
    }

    public Timestamp getDate() {
        return date;
    }

    public Question setDate(Timestamp date) {
        this.date = date;
        return this;
    }

    @Override
    public String toString() {
        return isEmpty() ? "Question:[EMPTY]" : String.format("Question:[id:%d, number:%s, text:%s, date:%s]",id,number,text,date.toString());
    }
}
