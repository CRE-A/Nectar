package project.nectar.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.nectar.domain.QNADto;

import java.util.List;

@Repository
public class QNADaoImpl implements QNADao {
    @Autowired
    SqlSession session;
    private String namespace="project.nectar.repository.QNAMapper.";


    @Override
    public List<QNADto> selectAll(){
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public QNADto select(Integer qna_NUM){
        return session.selectOne(namespace+"select",qna_NUM);
    }

    @Override
    public int insert(QNADto qnaDto){
        return session.insert(namespace+"insert",qnaDto);
    }

}
