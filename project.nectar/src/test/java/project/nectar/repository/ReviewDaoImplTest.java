package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.ReviewDto;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReviewDaoImplTest {
    @Autowired
    private ReviewDao reviewDao;
    @Autowired
    private RestrDao restrDao;

    @Test
    public void count() {
    }

    @Test
    public void selectAll() {
    }

    @Test
    public void select() {
    }

    @Test
    public void insert() {
    }

    @Test
    public void deleteAll() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void updateComment() {
    }

    @Test
    public void getAvgStar() {
    }

    @Test
    public void insert_Data() throws Exception{
//        reviewDao.deleteAll(445);
//        assertTrue(reviewDao.count(445)==0);

        for(int i=1; i<=33; i++){
            ReviewDto reviewDto = new ReviewDto(445,"User_"+i+"@google.com","음식이 나쁘진 않은데, 가격대비 구림 -hb"+i,"asd323",1.5f);
                    reviewDao.insert(reviewDto);
        }
    }

    @Test
    public void insert_Data2() throws Exception{
//        reviewDao.deleteAll(445);
//        assertTrue(reviewDao.count(445)==0);

        for(int i=1; i<=300; i++){
            ReviewDto reviewDto = new ReviewDto(445+i,"User_500@google.com","옥수수 찐만두보다 못하네 ㅉㅉ","kkk323",2.5f);
            reviewDao.insert(reviewDto);
        }
    }

    @Test
    public void insert_Data3() throws Exception{
//        reviewDao.deleteAll(445);
//        assertTrue(reviewDao.count(445)==0);

        for(int i=1; i<=300; i++){
            for(int j=1; j<=20; j++){
                ReviewDto reviewDto = new ReviewDto(444+i,"User_"+j+"google.com","나의 리뷰를 이용하라 m.blog.naver.com/intae","no pic",((int)(Math.random()*5)+1));
                reviewDao.insert(reviewDto);
            }
        }
    }

}