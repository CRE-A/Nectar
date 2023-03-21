package project.nectar.domain;

import java.util.Objects;

public class QNADto {
    private Integer qna_NUM;
    private String qna_title;
    private String qna_content;
    private String qna_picture;
    private String qna_regdate;

    public QNADto() {this("title","content","no_pic");}
    public QNADto(String qna_title, String qna_content, String qna_picture) {
        this.qna_title = qna_title;
        this.qna_content = qna_content;
        this.qna_picture = qna_picture;
    }

    public Integer getQna_NUM() {
        return qna_NUM;
    }

    public void setQna_NUM(Integer qna_NUM) {
        this.qna_NUM = qna_NUM;
    }

    public String getQna_title() {
        return qna_title;
    }

    public void setQna_title(String qna_title) {
        this.qna_title = qna_title;
    }

    public String getQna_content() {
        return qna_content;
    }

    public void setQna_content(String qna_content) {
        this.qna_content = qna_content;
    }

    public String getQna_picture() {
        return qna_picture;
    }

    public void setQna_picture(String qna_picture) {
        this.qna_picture = qna_picture;
    }

    public String getQna_regdate() {
        return qna_regdate;
    }

    public void setQna_regdate(String qna_regdate) {
        this.qna_regdate = qna_regdate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        QNADto qnaDto = (QNADto) o;
        return Objects.equals(qna_NUM, qnaDto.qna_NUM) && Objects.equals(qna_title, qnaDto.qna_title);
    }

    @Override
    public int hashCode() {
        return Objects.hash(qna_NUM, qna_title);
    }

    @Override
    public String toString() {
        return "QNA{" +
                "qna_NUM=" + qna_NUM +
                ", qna_title='" + qna_title + '\'' +
                ", qna_content='" + qna_content + '\'' +
                ", qna_picture='" + qna_picture + '\'' +
                ", qna_regdate='" + qna_regdate + '\'' +
                '}';
    }
}
