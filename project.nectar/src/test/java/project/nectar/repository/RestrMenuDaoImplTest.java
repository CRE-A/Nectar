package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.RestrMenuDto;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class RestrMenuDaoImplTest {
    @Autowired
    RestrMenuDao restrMenuDao;

    @Test
    public void selectAllMenu() {
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
    public void update() {
    }

    @Test
    public void updateHotdeal() {
    }

    @Test
    public void insert_data1() throws Exception {

        for(int i=1; 2*i-1<=70; i++){
            RestrMenuDto restrMenuDto1 = new RestrMenuDto(i,"김치찌게",7000,"집밥이 떠오르는 그맛, 정통 김치찌게");
            RestrMenuDto restrMenuDto2 = new RestrMenuDto(i,"된장찌게",7200,"직접 담근 청국장을 구수하게 푼 된장찌게");
            RestrMenuDto restrMenuDto3 = new RestrMenuDto(i,"제육덥밥",6500,"7가지 양념에 재웠다 볶은 제육, 맵지않아요");
            RestrMenuDto restrMenuDto4 = new RestrMenuDto(i,"오징어덥밥",8000,"매콤한게 땡길 때는 이거다");
            RestrMenuDto restrMenuDto5 = new RestrMenuDto(i,"백반정식",6500,"7찬이 나오는 정갈한 가정식 백반");
            restrMenuDao.insert(restrMenuDto1);
            restrMenuDao.insert(restrMenuDto2);
            restrMenuDao.insert(restrMenuDto3);
            restrMenuDao.insert(restrMenuDto4);
            restrMenuDao.insert(restrMenuDto5);
        }

        for(int i=1; 2*i<=70; i++){
            RestrMenuDto restrMenuDto1 = new RestrMenuDto(i,"참치김밥",4000,"참치가 들어가 고소하고 짭잘해요");
            RestrMenuDto restrMenuDto2 = new RestrMenuDto(i,"김치김밥",3500,"김치가 들어간 김밥");
            RestrMenuDto restrMenuDto3 = new RestrMenuDto(i,"치즈김밥",4200,"짜지않은 채다치즈가 들어갔어요");
            RestrMenuDto restrMenuDto4 = new RestrMenuDto(i,"야채김밥",3000,"4가지 야채가 들어간 기본김밥");
            RestrMenuDto restrMenuDto5 = new RestrMenuDto(i,"고기만두",4500,"고기가 들어간 만두");
            RestrMenuDto restrMenuDto6 = new RestrMenuDto(i,"김치만두",4200,"다진김치를 속으로 넣은 만두");
            restrMenuDao.insert(restrMenuDto1);
            restrMenuDao.insert(restrMenuDto2);
            restrMenuDao.insert(restrMenuDto3);
            restrMenuDao.insert(restrMenuDto4);
            restrMenuDao.insert(restrMenuDto5);
            restrMenuDao.insert(restrMenuDto6);
        }



        for(int i=71; 2*i-1<=110; i++){
            RestrMenuDto restrMenuDto1 = new RestrMenuDto(i,"시푸드 파스타",12000,"해산물 넣은거 맞냐?");
            RestrMenuDto restrMenuDto2 = new RestrMenuDto(i,"그냥 파스타",11200,"평범");
            RestrMenuDto restrMenuDto3 = new RestrMenuDto(i,"햇 노맛 파스타",10000,"싼대는 이유가 있겠지");
            RestrMenuDto restrMenuDto4 = new RestrMenuDto(i,"핵 비싼 샐러드",8000,"풀때기");
            RestrMenuDto restrMenuDto5 = new RestrMenuDto(i,"알리오올리오",1400,"이게뭐냐");
            restrMenuDao.insert(restrMenuDto1);
            restrMenuDao.insert(restrMenuDto2);
            restrMenuDao.insert(restrMenuDto3);
            restrMenuDao.insert(restrMenuDto4);
            restrMenuDao.insert(restrMenuDto5);
        }

        for(int i=71; 2*i<=110; i++){
            RestrMenuDto restrMenuDto1 = new RestrMenuDto(i,"뉴욕 스테이크",38000,"뉴욕에서 먹는 맛이냐");
            RestrMenuDto restrMenuDto2 = new RestrMenuDto(i,"립아이 ",35000,"기본 스테이크");
            RestrMenuDto restrMenuDto3 = new RestrMenuDto(i,"양갈비 스테이크",32000,"양고기 특유의 냄새 가득");
            RestrMenuDto restrMenuDto4 = new RestrMenuDto(i,"랍스타",43000,"기본 랍스타");
            RestrMenuDto restrMenuDto5 = new RestrMenuDto(i,"와인",70000,"특별한 날 분위기 내야지");
            restrMenuDao.insert(restrMenuDto1);
            restrMenuDao.insert(restrMenuDto2);
            restrMenuDao.insert(restrMenuDto3);
            restrMenuDao.insert(restrMenuDto4);
            restrMenuDao.insert(restrMenuDto5);
        }



    }

}