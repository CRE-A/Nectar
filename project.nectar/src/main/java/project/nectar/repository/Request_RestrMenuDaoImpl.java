package project.nectar.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.nectar.domain.RestrMenuDto;

import java.util.List;

@Repository
public class Request_RestrMenuDaoImpl implements Request_RestrMenuDao {
    @Autowired
    SqlSession session;
    String namespace="project.nectar.repository.Request_RestrMenuMapper.";


    @Override
    public List<RestrMenuDto> selectAll(Integer request_restr_NUM){
        return session.selectList(namespace+"selectAll",request_restr_NUM);
    }

    @Override
    public int insert(RestrMenuDto restrMenuDto){
        return session.insert(namespace+"insert",restrMenuDto);
    }

    @Override
    public int delete(Integer request_restr_NUM){
        return session.delete(namespace+"delete",request_restr_NUM);
    }



}
