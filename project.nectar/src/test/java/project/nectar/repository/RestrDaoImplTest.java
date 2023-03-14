package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.RestrDto;
import project.nectar.domain.RestrMenuDto;
import project.nectar.domain.SearchCondition;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RestrDaoImplTest {
    @Autowired
    private RestrDao restrDao;
    @Autowired
    private ReviewDao reviewDao;
    @Autowired
    private LikelistDao likelistDao;

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
//        assertTrue(restrDao.count()==0); // 총 카운트 바꿔줘
        restrDao.deleteAll();
//        assertTrue(restrDao.count()==0);
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
    public void updateHotdeal() throws Exception{
        RestrDto restrDto=new RestrDto();
        restrDto.setRestr_NUM(1);           // 1번 레스토랑에서 핫딜 진행중
        restrDto.setRestr_hotdeal_NUM(10);  // hotdeal_NUM = 10
        restrDao.updateHotdeal(restrDto);

        RestrDto restrDto2=new RestrDto();
        restrDto2.setRestr_NUM(2);          // 2번 레스토랑에서 핫딜 진행중
        restrDto2.setRestr_hotdeal_NUM(11); // hotdeal_NUM = 11
        restrDao.updateHotdeal(restrDto2);

    }



//
//    @Test
//    public void updateHotdeal() throws Exception {
////        RestrMenuDto restrMenuDto = new RestrMenuDto();
////        restrMenuDto.setRestr_menu_NUM(1); //
////        restrMenuDto.setRestr_menu_hotdeal_NUM(10); // 메뉴
////        restrMenuDao.updateHotdeal(restrMenuDto);
////
//        RestrMenuDto restrMenuDto = new RestrMenuDto();
//        restrMenuDto.setRestr_menu_NUM(6); //
//        restrMenuDto.setRestr_menu_hotdeal_NUM(11); // 메뉴
//        restrDao.updateHotdeal(restrMenuDto);
//
//
//    }






    @Test
    public void insert_Data()throws Exception{
        restrDao.deleteAll();
        assertTrue(restrDao.count()==0);

        for (Integer i = 1; i <= 70; i++) {
            RestrDto restrDto = new RestrDto("맛집"+i,37.4500+(Math.random()/15.0),127.0100+(Math.random()/15.0),"서울 강남구 신사동", "신사 강남역 강남 가로수길", "02-1234-5678","10:00-20:00", 3.3f ,"한식","2만원대","주차가능","데이트 분위기 좋은곳  가로수길 인스타그램 인스타 핫플 커플 예쁜 셀카","고기 돼지고기 양념갈비 갈비 삼겹살 냉면 밥 찌게 김치찌게 된장찌게", "서울에 위치한 돼지고기 맛집이다. 직접 구워주기 때문에 더욱 맛있게 먹을 수 있다.","pic_url_path"+i,"신사/압구정", "Biz_"+i+"@google.com","biz_reg_num_"+i);
            restrDao.insertAll(restrDto);

//            lat: 37.5132, lng: 126.942

        }
    }

    @Test
    public void insert_Data2()throws Exception{

        for (Integer i = 71; i <= 110; i++) {
            RestrDto restrDto = new RestrDto("Test맛집"+i,37.4500+(Math.random()/15.0),127.0100+(Math.random()/15.0),"서울 강남구 신사동", "신사 강남역 강남 가로수길", "02-4682-5861","10:00-20:00", 2.3f ,"양식","1만원대","상관없음","데이트 분위기 좋은곳  가로수길 인스타그램 인스타 핫플 커플 예쁜 셀카","파스타 스테이크 빵 스프", "서울에 위치한 프랑스 가정요리 맛집이다. 예쁜 카페분위기 때문에 데이트 장소로 유명하다.","pic_url_path"+(i+100),"신사/압구정","Biz_"+i+"@google.com" ,"biz_reg_num_"+i);
            restrDao.insertAll(restrDto);
        }
    }


    @Test
    public void sync_ReviewCnt()throws Exception{
        
        for(int restr_NUM=1; restr_NUM<=110; restr_NUM++){
            RestrDto restrDto = new RestrDto();
            restrDto.setRestr_NUM(restr_NUM);
            int reviewCnt = reviewDao.count(restr_NUM);
            restrDto.setRestr_reviewCnt(reviewCnt);
            restrDao.sync_ReviewCnt(restrDto);
//            System.out.println("restrDto = " + restrDto);
        }
    }


    @Test
    public void sync_updateStar() throws Exception {

        for (int restr_NUM = 1; restr_NUM <= 110; restr_NUM++) {
            RestrDto restrDto = new RestrDto();
            restrDto.setRestr_NUM(restr_NUM);
            float avgStar = reviewDao.getAvgStar(restr_NUM);
            restrDao.updateStar(restr_NUM, avgStar);
        }
    }




}

