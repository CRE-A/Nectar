package com.fastcampus.ch4.service;

import com.fastcampus.ch4.dao.BoardDao_JH;
import com.fastcampus.ch4.domain.BoardDto_JH;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BoardServiceImpl_JH implements BoardService_JH {
    @Autowired
    BoardDao_JH boardDao_jh;

    @Override
    public int count() throws Exception {
        return boardDao_jh.count();
    }

    @Override
    public List<BoardDto_JH> selectAll() throws Exception {
        return boardDao_jh.selectAll();
    }

    @Override
    public List<BoardDto_JH> selectPage(HashMap map) throws Exception {
        return boardDao_jh.selectPage(map);
    }

    @Override
    public BoardDto_JH select(int bno) throws Exception {
        boardDao_jh.increaseViewCnt(bno);
        return boardDao_jh.select(bno);
    }

    @Override
    public int insert(BoardDto_JH boardDto_jh) throws Exception {
        return boardDao_jh.insert(boardDto_jh);
    }

    @Override
    public int deleteAll() throws Exception{
        return boardDao_jh.deleteAll();
    }

    @Override
    public int delete(HashMap map) throws Exception{
        return boardDao_jh.delete(map);
    }

    @Override
    public int update(BoardDto_JH boardDto_jh) throws Exception{
        return boardDao_jh.update(boardDto_jh);
    }

}
