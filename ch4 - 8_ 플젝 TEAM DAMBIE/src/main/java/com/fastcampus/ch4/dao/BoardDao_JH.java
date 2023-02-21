package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BoardDto_JH;

import java.util.HashMap;
import java.util.List;

public interface BoardDao_JH {
    int count() throws Exception;

    List<BoardDto_JH> selectAll() throws Exception;

    List<BoardDto_JH> selectPage(HashMap map) throws Exception;

    BoardDto_JH select(int bno) throws Exception;

    int insert(BoardDto_JH boardDto_jh) throws Exception;

    int deleteAll() throws Exception;

    int delete(HashMap map) throws Exception;

    int update(BoardDto_JH boardDto_jh) throws Exception;

    int increaseViewCnt(int bno) throws Exception;

    int updateCommentCnt(HashMap map) throws Exception;
}
