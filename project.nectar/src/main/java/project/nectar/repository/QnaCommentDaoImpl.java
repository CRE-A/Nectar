package project.nectar.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.nectar.domain.QNADto;

import java.util.HashMap;
import java.util.List;

@Repository
public class QnaCommentDaoImpl implements QnaCommentDao {
    @Autowired
    SqlSession session;
    private String namespace="project.nectar.repository.QnaCommentMapper.";


    @Override
    public List<QNADto> selectAll(Integer qna_NUM)throws  Exception{
        return session.selectList(namespace+"selectAll", qna_NUM);
    }

    @Override
    public Integer insertComment(Integer qna_NUM, String qna_comment)throws Exception{
        HashMap map = new HashMap();
        map.put("qna_NUM",qna_NUM);
        map.put("qna_comment",qna_comment);
        return session.insert(namespace+"insert",map);
    }

    @Override
    public Integer deleteComment(Integer qna_comment_NUM)throws Exception{
        return session.delete(namespace+"delete",qna_comment_NUM);
    }
}
