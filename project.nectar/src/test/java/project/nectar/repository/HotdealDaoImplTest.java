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
    public void insert_data() throws Exception {

//        HotdealDto hotdealDto = new HotdealDto(1, "맛집1", "신사/압구정", 1, "no pic", "김치찌게", 6000, 3000, "50%", "파격세일. 빨리사라", "90일", "2023/03/14 ~ 2023/03/27", 70, "Biz_1@google.com");
//        hotdealDao.insert(hotdealDto);
        //test data를 매우 단순하게 넣어서 1개만 넣어보자.

//        for(int i=1; i<=15;i++){
//            HotdealDto hotdealDto = new HotdealDto();
//            hotdealDao.insert(hotdealDto);
//        }

        for(Integer i=1; i<=3; i++){
            HotdealDto hotdealDto1 = new HotdealDto(3*i,"맛집"+3*i,"신사/압구정",15*i-2,"pic_url", "제육덮밥", 6500, 4550, 30,"시그니쳐 메뉴, 집밥 감성 제육", "2023-03-15 ~ 2023-04-01","90일", 0, 100,"Biz_"+3*i+"@google.com");
            hotdealDao.insert(hotdealDto1);
        }

        for(Integer i=4; i<=6; i++){
            HotdealDto hotdealDto1 = new HotdealDto(3*i,"맛집"+3*i,"신사/압구정",15*i-4,"pic_url", "김치찌게", 7000, 5250, 25,"어머니 손맛 그대로 얼큰 칼칼하게", "2023-03-24 ~ 2023-04-10","90일", 0, 80,"Biz_"+3*i+"@google.com");
            hotdealDao.insert(hotdealDto1);

        }




    }
}