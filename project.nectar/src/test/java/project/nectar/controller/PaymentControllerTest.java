package project.nectar.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import project.nectar.domain.PaymentDto;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class PaymentControllerTest {
    @Autowired
    PaymentController paymentController;

    @Test
    public void pay() {
    }

    @Test
    public void cancel() {
    }

    @Test
    public void success() {
    }

    @Test
    public void fail() {
    }

    @Test
    public void insert_Data() throws Exception{
        for(int i=1; i<=3; i++){
            PaymentDto paymentDto = new PaymentDto("imp_uid_"+i,"merchant_uid_"+i,"user_"+i+"@google.com","2023-04-01 14:0"+i,"5250","110-222333-444", "","biz_"+(3*i)+"@google.com", i);
            paymentController.pay(paymentDto);
        }


        for(int i=4; i<=102; i++){
            PaymentDto paymentDto2 = new PaymentDto("imp_uid_"+i,"merchant_uid_"+i,"user_"+i+"@google.com","2023-04-01 14:0"+i,"5250","110-222333-444", "","biz_3@google.com", 1);
            paymentController.pay(paymentDto2);
        }


    }


    @Test
    public void insert_Data2() throws Exception{



    }


    @Test
    public void insert_Data3() throws Exception{



    }


    @Test
    public void insert_Data4() throws Exception{
        // payment = 103
            PaymentDto paymentDto3 = new PaymentDto("imp_uid_103","merchant_uid_103","user_1@google.com","2023-04-01 14:0103","5250","110-222333-444", "","biz_6@google.com", 2);
            paymentController.pay(paymentDto3);
    }




}