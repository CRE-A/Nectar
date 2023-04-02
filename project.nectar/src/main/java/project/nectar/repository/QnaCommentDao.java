package project.nectar.repository;

import project.nectar.domain.QNADto;

import java.util.List;

public interface QnaCommentDao {
    List<QNADto> selectAll(Integer qna_NUM)throws  Exception;

    Integer insertComment(Integer qna_NUM, String qna_comment) throws Exception;

    Integer deleteComment(Integer qna_comment_NUM) throws Exception;
}
