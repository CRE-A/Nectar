package project.nectar.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;

import java.util.HashMap;
import java.util.List;


@Repository
public class RestrDaoImpl implements RestrDao {
    @Autowired
    SqlSession session;
    private String namespace="project.nectar.repository.RestrMapper.";

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception{
        return session.selectOne(namespace+"searchResultCnt",sc);
    }

    @Override
    public List<RestrDto> SearchResultPage(SearchCondition sc) throws Exception{
        return session.selectList(namespace+"SearchResultPage",sc);
    }

    @Override
    public RestrDto select(int restr_NUM) throws Exception{
        return session.selectOne(namespace+"select", restr_NUM);
    }

    @Override
    public int count() throws Exception{
        return session.selectOne(namespace+"count");
    }

    @Override
    public int deleteAll() throws Exception{
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int delete(RestrDto restrDto) throws Exception{
        return session.delete(namespace+"delete", restrDto);
    }

    @Override
    public int insertAll(RestrDto restrDto) throws Exception{
        return session.insert(namespace+"insertAll",restrDto);
    }

    @Override
    public int update(RestrDto restrDto) throws Exception{
        return session.update(namespace+"update",restrDto);
    }

    @Override
    public int updateViewCnt(Integer restr_NUM) throws Exception{
        return session.update(namespace+"updateViewCnt", restr_NUM);
    }

    @Override
    public int updateReviewCnt(Integer restr_NUM, int cnt) throws Exception{
        HashMap map = new HashMap();
        map.put("cnt",cnt);
        map.put("restr_NUM", restr_NUM);
        return session.update(namespace+"updateReviewCnt", map);
    }

    @Override
    public int updateLikeCnt(Integer restr_NUM, int cnt) throws Exception{
        HashMap map = new HashMap();
        map.put("cnt",cnt);
        map.put("restr_NUM", restr_NUM);
        return session.update(namespace+"updateLikeCnt", map);
    }
    // LikelistServiceImpl 의 @Transactional public int write(LikelistDto likelistDto) throws Exceptions{
    // restr.updateLikeCnt(restrDto.getRestr_NUM(),1)
    // return LikelistDao.insert(likelistDto);
    // }

    @Override
    public int updateStar(RestrDto restrDto) throws Exception{
        return session.update(namespace+"updateStar",restrDto);
    }
}
