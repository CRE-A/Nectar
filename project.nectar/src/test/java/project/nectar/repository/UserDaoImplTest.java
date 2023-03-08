package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.RestrDto;
import project.nectar.domain.UserDto;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {

    @Autowired
    private UserDao userDao;
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
        userDao.deleteAll();
//        assertTrue(userDao.count()==500);

        for (Integer i = 1; i <= 500; i++) {
            UserDto userDto = new UserDto("User_"+i+"@google.com","1234","name"+i,"010-1234-567"+i,"as124dfsdf134");
            userDao.insert(userDto);
        }
    }
}