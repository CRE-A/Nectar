package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.BizAccountDto;
import project.nectar.domain.UserDto;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BizAccountDaoImplTest {
    @Autowired
    BizAccountDao bizAccountDao;

    @Test
    public void insert() {
    }

    @Test
    public void select() {
    }

    @Test
    public void update() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void deleteAll() {
    }

    @Test
    public void count() {
    }

    @Test
    public void insert_Data()throws Exception{
        bizAccountDao.deleteAll();
        assertTrue(bizAccountDao.count()==0);

        for (Integer i = 1; i <= 500; i++) {
            BizAccountDto bizDto = new BizAccountDto("Biz_"+i+"@google.com","1234","name"+i,"010-1234-555"+i,"as124dfsdf134","REGNUM"+i);
            bizAccountDao.insert(bizDto);
        }
    }
}