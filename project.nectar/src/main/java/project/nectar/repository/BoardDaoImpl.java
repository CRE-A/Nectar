//package project.nectar.repository;
//
//import project.nectar.domain.BoardDto;
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import java.util.HashMap;
//import java.util.List;
//
//@Repository
//public class BoardDaoImpl implements BoardDao {
//    @Autowired
//    SqlSession session;
//    private String namespace="project.nectar.repository.BoardMapper.";
//
//    @Override
//    public int count() throws Exception{
//        return session.selectOne(namespace+"count");
//    }
//
//    @Override
//    public List<BoardDto> selectAll() throws Exception{
//        return session.selectList(namespace+"selectAll");
//    }
//
//    @Override
//    public List<BoardDto> selectPage(HashMap map) throws Exception{
//        return session.selectList(namespace+"selectPage", map);
//    }
//
//    @Override
//    public BoardDto select(int bno) throws Exception{
//        return session.selectOne(namespace+"select",bno);
//    }
//
//    @Override
//    public int insert(BoardDto boardDto) throws Exception{
//        return session.insert(namespace+"insert", boardDto);
//    }
//
//    @Override
//    public int deleteAll() throws Exception{
//        return session.delete(namespace+"deleteAll");
//    }
//
//    @Override
//    public int delete(HashMap map) throws Exception{
//        return session.delete(namespace+"delete", map);
//    }
//
//    @Override
//    public int update(BoardDto boardDto) throws Exception{
//        return session.update(namespace+"update",boardDto);
//    }
//
//    @Override
//    public int increaseViewCnt(int bno) throws Exception{
//        return session.update(namespace+"increaseViewCnt", bno);
//    }
//
//    @Override
//    public int updateCommentCnt(HashMap map) throws Exception{
//        return session.update(namespace+"updateCommentCnt", map);
//    }
//
//}
