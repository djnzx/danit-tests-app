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

    public String textHtml() {
        StringBuilder sb = new StringBuilder();
        boolean first = true;
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            switch (c) {
                case '\n' : sb.append("<br>");
                    break;
                case '`' :  sb.append(first ? "<pre>" : "</pre>");
                    first = ! first;
                    break;
                default   : sb.append(c);
            }
        }
        return sb.toString();
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
        return isEmpty() ? "Question:[EMPTY]" : String.format("Question:[id:%d, number:%s, text:%s, header:%s, date:%s]",id,number,text,header,date.toString());
    }
}
