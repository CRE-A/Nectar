package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.BrowserHistoryDto;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BrowserHistoryDaoImplTest {
    @Autowired BrowserHistoryDao browserHistoryDao;

    @Test
    public void select_TopSearchKeyword() {
    }

    @Test
    public void selectByJSESSIONID() {
    }

    @Test
    public void selectByUser_email() {
    }

    @Test
    public void insertKeyword() {
    }

    @Test
    public void insertRestrNUM() {
    }

    @Test
    public void insertHotdealNUM() {
    }

    @Test
    public void deleteUserEmail() {
    }

    @Test
    public void deleteJSESSIONID() {
    }

    @Test
    public void insert_data() throws Exception {

        //우선 검색한 keyword data insert

        for (Integer i = 1; i <= 20; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("65B78EF96C45A566F46EF28A78F5588" + i);
            browserHistoryDto3.setSearchKeyword("한식");
            browserHistoryDao.insertKeyword(browserHistoryDto3);

        }


        for (Integer i = 1; i <= 20; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("65B78EF96C45A566F46EF28A78F55F8" + i);
            browserHistoryDto3.setUser_email("User_"+i+"@google.com");
            browserHistoryDto3.setSearchKeyword("한식");
            browserHistoryDao.insertKeyword(browserHistoryDto3);

        }

        for(Integer i=1; i<=30; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("65B78EF96C45A566F46EF28A78F5583" + i);
            browserHistoryDto3.setSearchKeyword("양식");
            browserHistoryDao.insertKeyword(browserHistoryDto3);
        }

        for(Integer i=1; i<=25; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("65B78EF96C45A566F46EF28A78F5577" + i);
            browserHistoryDto3.setSearchKeyword("일식");
            browserHistoryDao.insertKeyword(browserHistoryDto3);
        }

        for(Integer i=1; i<=20; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("65B78EF96C45A566F46EF28A78F5545" + i);
            browserHistoryDto3.setSearchKeyword("데이트");
            browserHistoryDao.insertKeyword(browserHistoryDto3);
        }

        for(Integer i=1; i<=15; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("65B78EF96C45A566F46EF28A78F5519" + i);
            browserHistoryDto3.setSearchKeyword("핫플");
            browserHistoryDao.insertKeyword(browserHistoryDto3);
        }

        for(Integer i=1; i<=10; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("65B78EF96C45A566F46EF28A78F5519" + i);
            browserHistoryDto3.setSearchKeyword("인스타");
            browserHistoryDto3.setUser_email("User_"+(i+400)+"@google.com");
            browserHistoryDao.insertKeyword(browserHistoryDto3);
        }


        //재호 sessionID
        BrowserHistoryDto browserHistoryDto1 = new BrowserHistoryDto();
        browserHistoryDto1.setJSESSIONID("DFFDE615F5FC0102F440FFAEB7F3F098");
        browserHistoryDto1.setSearchKeyword("한식");
        browserHistoryDao.insertKeyword(browserHistoryDto1);



        //혜빈 sessionID
        BrowserHistoryDto browserHistoryDto2 = new BrowserHistoryDto();
        browserHistoryDto2.setJSESSIONID("65B78EF96C45A566F46EF28A78F5588F");
        browserHistoryDto2.setSearchKeyword("한식");
        browserHistoryDao.insertKeyword(browserHistoryDto2);



        //최근 조회한 게시물  data insert
        //레스토랑

        //
        //재호 sessionID  :   DFFDE615F5FC0102F440FFAEB7F3F098
        for(Integer i=1; i<=10; i++) {
            BrowserHistoryDto browserHistoryDto3 = new BrowserHistoryDto();
            browserHistoryDto3.setJSESSIONID("DFFDE615F5FC0102F440FFAEB7F3F098");
            browserHistoryDto3.setRestr_NUM(4*i);
            browserHistoryDao.insertRestrNUM(browserHistoryDto3);
        }


        //혜빈 sessionID
        for(Integer i=1; i<=10; i++) {
            BrowserHistoryDto browserHistoryDto4 = new BrowserHistoryDto();
            browserHistoryDto4.setJSESSIONID("65B78EF96C45A566F46EF28A78F5588F");
            browserHistoryDto4.setUser_email("User_145@google.com");
            browserHistoryDto4.setRestr_NUM(7*i);
            browserHistoryDao.insertRestrNUM(browserHistoryDto4);
        }




        //최근 조회한 게시물  data insert
        //핫딜

        //재호 sessionID
        for(Integer i=1; i<=3; i++) {
            BrowserHistoryDto browserHistoryDto5 = new BrowserHistoryDto();
            browserHistoryDto5.setJSESSIONID("DFFDE615F5FC0102F440FFAEB7F3F098");
            browserHistoryDto5.setHotdeal_NUM(i*1);
            browserHistoryDao.insertHotdealNUM(browserHistoryDto5);
        }





    }


}