package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.HotdealDto;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class HotdealDaoImplTest {
    @Autowired
    HotdealDao hotdealDao;

    @Test
    public void selectMyHotdeals() {
    }

    @Test
    public void selectAll() {
    }

    @Test
    public void select() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void update() {
    }

    @Test
    public void insert() {
    }


    @Test
    public void insert_data()throws Exception{

        hotdealDao.insert(new HotdealDto(0+1,"맛집1","신사/압구정",1,"no pic","김치찌게",0+6000,0+3000,"50%","파격세일. 빨리사라","90일","2023/03/14 ~ 2023/03/27",0+70,"Biz_1@google.com"));


//        for(int i=1; i<=15;i++){
//            HotdealDto hotdealDto = new HotdealDto();
//            hotdealDao.insert(hotdealDto);
//        }

    }
}