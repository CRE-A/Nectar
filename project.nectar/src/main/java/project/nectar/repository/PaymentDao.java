package project.nectar.repository;

import project.nectar.domain.HotdealPlusDto;
import project.nectar.domain.PaymentDto;

import java.util.List;

public interface PaymentDao {
    Integer count(PaymentDto paymentDto) throws Exception;

    List<HotdealPlusDto> PaymentAndHotdeal_byUser(String user_email) throws Exception;

    List<HotdealPlusDto> PaymentAndHotdeal_byBiz(String bizAccount_email) throws Exception;


    Integer insert(PaymentDto paymentDto) throws Exception;

    Integer delete(PaymentDto paymentDto) throws Exception;
}
