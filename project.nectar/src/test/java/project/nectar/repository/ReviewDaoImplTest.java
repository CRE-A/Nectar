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

        for(int i=1; i<=110; i++){
            ReviewDto reviewDto = new ReviewDto(0+i,"user_"+(301-i)+"@google.com", "name"+(301-i), "default_profile.jpg", "음식이 나쁘진 않은데, 가격대비 구림 -hb"+i,"review"+((int)(Math.random()*14)+1)+".jpg",((int)(Math.random()*5)+1));
            reviewDao.insert(reviewDto);
        }
    }

    @Test
    public void insert_Data2() throws Exception{

        for(int i=1; i<=110; i++){
            ReviewDto reviewDto = new ReviewDto(0+i,"user_"+(501-i)+"@google.com", "name"+(501-i), "default_profile.jpg","옥수수 찐만두보다 못하네 ㅉㅉ","review"+((int)(Math.random()*14)+1)+".jpg",((int)(Math.random()*5)+1));
            reviewDao.insert(reviewDto);
        }
    }

    @Test
    public void insert_Data3() throws Exception{
//        reviewDao.deleteAll(445);

        for(int i=1; i<=100; i++){
            for(int j=1; j<=7; j++){
                ReviewDto reviewDto = new ReviewDto(0+i,"user_"+j+"google.com", "name"+j,"default_profile.jpg","나의 리뷰를 이용하라","review"+((int)(Math.random()*14)+1)+".jpg",((int)(Math.random()*5)+1));
                reviewDao.insert(reviewDto);
            }
        }
    }

}