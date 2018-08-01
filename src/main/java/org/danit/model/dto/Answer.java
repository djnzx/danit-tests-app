package org.danit.model.dto;

public class Answer extends AbstractEntity {
    private int questionId;
    private String text;
    private int type;

    public Answer() {
    }

    public Answer(int questionId, String text) {
        this.questionId = questionId;
        this.text = text;
    }

    public Answer(int id, int questionId, String text, int type) {
        this.id = id;
        this.questionId = questionId;
        this.text = text;
        this.type = type;
    }

    public Answer(int questionId, String text, int type) {
        this.questionId = questionId;
        this.text = text;
        this.type = type;
    }

    public int getQuestionId() {
        return questionId;
    }

    public Answer setQuestionId(int questionId) {
        this.questionId = questionId;
        return this;
    }

    public String getText() {
        return text;
   }

    public Answer setText(String text) {
        this.text = text;
        return this;
    }

    public int getType() {
        return type;
    }

    public Answer setType(int type) {
        this.type = type;
        return this;
    }

    @Override
    public String toString() {
        return String.format("Answer:[id:%d, qId:%d, text:%s, type:%d]",id,questionId,text,type);
    }
}
