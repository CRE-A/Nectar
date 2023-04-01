package project.nectar.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import project.nectar.domain.PaymentDto;

import java.util.Date;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PaymentDaoImplTest {
@Autowired
PaymentDao paymentDao;


    @Test
    public void count() {
    }

    @Test
    public void select_PaymentAndHotdeal_byUser() {
    }

    @Test
    public void select_PaymentAndHotdeal_byBiz() {
    }

    @Test
    public void insert() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void insert_Data() throws Exception{
        for(int i=1; i<=6; i++){
            PaymentDto paymentDto = new PaymentDto("imp_uid_"+i,"merchant_uid_"+i,"user_"+i+"@google.com","2023-04-01 14:0"+i,"5250","110-222333-444", "","biz_"+(3*i)+"@google.com", i);
            paymentDao.insert(paymentDto);
        }
    }

    @Test
    public void insert_Data2() throws Exception{
        for(int i=4; i<=7; i++){
            PaymentDto paymentDto = new PaymentDto("imp_uid_"+i,"merchant_uid_"+i,"user_"+i+"@google.com","2023-04-01 14:0"+i,"5250","110-222333-444", "","biz_3@google.com", 1);
            paymentDao.insert(paymentDto);
        }
    }

}