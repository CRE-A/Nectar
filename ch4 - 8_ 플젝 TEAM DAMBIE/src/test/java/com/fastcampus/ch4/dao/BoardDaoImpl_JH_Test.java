package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BoardDto_JH;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class BoardDaoImpl_JH_Test {
    @Autowired
    private BoardDao_JH boardDao_JH;

    @Test
    public void insert_Data() throws Exception {
        boardDao_JH.deleteAll();
        assertTrue(boardDao_JH.count()==0);

        for(int i=1; i<=300; i++){
        BoardDto_JH boardDto_JH = new BoardDto_JH("title "+i,"content "+i, "writer "+i);
        boardDao_JH.insert(boardDto_JH);
        }
    }

    @Test
    public void insert_Data2() throws Exception {
//        boardDao_JH.deleteAll();
//        assertTrue(boardDao_JH.count()==300);

        for(int i=1; i<=20; i++){
            BoardDto_JH boardDto_JH = new BoardDto_JH("CRUD TEST"+i,"content "+i, "asdf");
            boardDao_JH.insert(boardDto_JH);
        }
    }

}