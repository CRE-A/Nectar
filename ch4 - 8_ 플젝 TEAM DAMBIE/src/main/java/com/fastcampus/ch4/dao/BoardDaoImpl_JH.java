package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BoardDto_JH;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class BoardDaoImpl_JH implements BoardDao_JH {
    @Autowired
    SqlSession session;
    private String namespace="com.fastcampus.ch4.dao.BoardMapper.";

    @Override
    public int count() throws Exception{
        return session.selectOne(namespace+"count");
    }

    @Override
    public List<BoardDto_JH> selectAll() throws Exception{
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public List<BoardDto_JH> selectPage(HashMap map) throws Exception{
        return session.selectList(namespace+"selectPage", map);
    }

    @Override
    public BoardDto_JH select(int bno) throws Exception{
        return session.selectOne(namespace+"select",bno);
    }

    @Override
    public int insert(BoardDto_JH boardDto_jh) throws Exception{
        return session.insert(namespace+"insert", boardDto_jh);
    }

    @Override
    public int deleteAll() throws Exception{
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int delete(HashMap map) throws Exception{
        return session.delete(namespace+"delete", map);
    }

    @Override
    public int update(BoardDto_JH boardDto_jh) throws Exception{
        return session.update(namespace+"update",boardDto_jh);
    }

    @Override
    public int increaseViewCnt(int bno) throws Exception{
        return session.update(namespace+"increaseViewCnt", bno);
    }

    @Override
    public int updateCommentCnt(HashMap map) throws Exception{
        return session.update(namespace+"updateCommentCnt", map);
    }

}
