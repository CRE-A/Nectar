package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.RestrDto;
import project.nectar.domain.SearchCondition;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RestrDaoImplTest {
    @Autowired
    private RestrDao restrDao;

    @Test
    public void searchResultCnt() throws Exception {
    }

    @Test
    public void searchSelectPage() {
    }

    @Test
    public void select() {
    }

    @Test
    public void deleteAll() throws Exception {
        assertTrue(restrDao.count()==0); // 총 카운트 바꿔줘
        restrDao.deleteAll();
        assertTrue(restrDao.count()==0);
    }

    @Test
    public void delete() {
    }

    @Test
    public void insertAll() {
    }

    @Test
    public void update() {
    }

    @Test
    public void insert_Data()throws Exception{
        restrDao.deleteAll();
        assertTrue(restrDao.count()==0);

        for (Integer i = 1; i <= 444; i++) {
            RestrDto restrDto = new RestrDto("맛집"+i,1.234+i,i+4.321,"서울 강남구 신사동", "신사 강남역 강남 가로수길", "02-1234-5678","10:00-20:00", 3.3f ,"한식","2만원대","주차가능","데이트 분위기 좋은곳  가로수길 인스타그램 인스타 핫플 커플 예쁜 셀카","고기 돼지고기 양념갈비 갈비 삼겹살 냉면 밥 찌게 김치찌게 된장찌게", "서울에 위치한 돼지고기 맛집이다. 직접 구워주기 때문에 더욱 맛있게 먹을 수 있다.","ASDFOIJJKDSF12324QWSADFAS","신사/압구정", "biz_reg_num"+i);
            restrDao.insertAll(restrDto);
        }
    }
}


//    @Test
//    public void insert_Data()throws Exception{
//        restrDao.deleteAll();
//        assertTrue(restrDao.count()==0);
//
//        for(int i=1; i<=300; i++){
//            RestrDto restrDto = new RestrDto("name"+i, 1.234567, 3.13234213, "서울 강남구 신사동", "서울 가로수길 강남역 신사 논현", "010-123-4567", "10:00~20:00", 3.5, "한식", "2만원대", "데이트 인스타그램 핫플 분위기좋은곳", "PARKING", "삼겹살 된장찌게 밥 불고기 제육", "desc : 50년 된 맛집이고 ~~~ 어쩌고 저쩌고 ~~~", 1, "url_pic", "pic_name", "biz_reg_num : asdlkfjsdiofjsdfji1"+i );
//            restrDao.insertAll(restrDto);
//        }
//    }