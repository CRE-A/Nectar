package teamProject.dao;

import teamProject.domain.BoardDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class BoardDaoImpl__Test {
    @Autowired
    private BoardDao boardDao;

    @Test
    public void insert_Data() throws Exception {
        boardDao.deleteAll();
        assertTrue(boardDao.count()==0);

        for(int i=1; i<=300; i++){
        BoardDto boardDto = new BoardDto("title "+i,"content "+i, "writer "+i);
        boardDao.insert(boardDto);
        }
    }

    @Test
    public void insert_Data2() throws Exception {
//        boardDaoJH.deleteAll();
//        assertTrue(boardDaoJH.count()==300);

        for(int i=1; i<=210; i++){
            BoardDto boardDto = new BoardDto("TEST DATA"+i,"content "+i, "asdf");
            boardDao.insert(boardDto);
        }
    }

}