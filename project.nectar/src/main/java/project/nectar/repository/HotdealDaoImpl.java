package project.nectar.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.nectar.domain.HotdealDto;

import java.util.List;

@Repository
public class HotdealDaoImpl implements HotdealDao {
    @Autowired
    SqlSession session;
    private String namespace="project.nectar.repository.HotdealMapper.";

    @Override
    public List<HotdealDto> selectMyHotdeals(String bizAccount_email) throws Exception{
        return session.selectList(namespace+"selectMyHotdeals" ,bizAccount_email);
    }

    @Override
    public List<HotdealDto> selectAll() throws Exception{
        return session.selectOne(namespace+"selectAll");
    }
    @Override
    public HotdealDto select(Integer hotdeal_NUM) throws Exception{
        return session.selectOne(namespace+"select", hotdeal_NUM);
    }

    @Override
    public int delete(Integer hotdeal_NUM) throws Exception{
        return session.delete(namespace+"delete", hotdeal_NUM);
    }

    @Override
    public int update(HotdealDto hotdealDto) throws Exception{
        return session.update(namespace+"update", hotdealDto);
    }

    @Override
    public int insert(HotdealDto hotdealDto) throws Exception{
        return session.insert(session+"insert",hotdealDto);
    }


}
